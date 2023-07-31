table 50900 "anbert Course"
{
    CaptionML = ENU = 'Course', ESP = 'Curso';
    DataCaptionFields = Name;
    fields
    {
        field(1; "No."; Code[20])
        {
            CaptionML = ENU = 'No.', ESP = 'Nº';

            trigger OnValidate()
            var
                ResSetup: record "anbert Courses Setup";
                NoSeriesMgt: Codeunit NoSeriesManagement;
            begin
                if "No." <> xRec."No." then begin
                    ResSetup.Get();
                    NoSeriesMgt.TestManual(ResSetup."Course Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Name; text[100]) { CaptionML = ENU = 'Name', ESP = 'Nombre Curso'; }
        field(3; "Content Description"; text[2048]) { CaptionML = ENU = 'Content Description', ESP = 'Descripción Curso'; }
        field(4; "Duration (hours)"; Integer) { CaptionML = ENU = 'Duration (Hours)', ESP = 'Duración (Horas)'; }
        field(5; Price; Decimal) { CaptionML = ENU = 'Price', ESP = 'Precio'; }
        field(6; "Type (Option)"; Option)
        {
            CaptionML = ENU = 'Type (Option)', ESP = 'Tipo (Opción)';
            OptionMembers = " ","Intructor-Lead","Video Tutorial";
            OptionCaptionML = ENU = ' ,Instructor-Lead,Video Tutorial', ESP = ' ,Guiado profesor,Video tutorial';
        }
        field(8; Type; Enum "anbert Course Type") { CaptionML = ENU = 'Course Type', ESP = 'Tipo Curso'; }
        field(7; "Language Code"; Code[10])
        {
            CaptionML = ENU = 'Language Code', ESP = 'Idioma Curso';
            TableRelation = Language;
        }
        field(56; "No. Series"; Code[20])
        {
            CaptionML = ENU = 'No. Series', ESP = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
    }
    trigger OnInsert()
    var
        ResSetup: record "anbert Courses Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin
            ResSetup.Get();
            ResSetup.TestField("Course Nos.");
            NoSeriesMgt.InitSeries(ResSetup."Course Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;

    end;

    procedure AssistEdit(OldRes: Record "anbert Course") Result: Boolean
    var
        // IsHandled: Boolean;
        ResSetup: record "anbert Courses Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        res: record "anbert Course";
    begin
        // IsHandled := false;
        // OnBeforeAssistEdit(Rec, OldRes, IsHandled, Result);
        // if IsHandled then
        //     exit;

        with Res do begin
            Res := Rec;
            ResSetup.Get();
            ResSetup.TestField("Course Nos.");
            if NoSeriesMgt.SelectSeries(ResSetup."Course Nos.", OldRes."No. Series", "No. Series") then begin
                ResSetup.Get();
                ResSetup.TestField("Course Nos.");
                NoSeriesMgt.SetSeries("No.");
                Rec := Res;
                exit(true);
            end;
        end;
    end;
}
