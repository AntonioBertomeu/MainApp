table 50900 "anbert Course"
{
    CaptionML = ENU = 'Course', ESP = 'Curso';
    DataClassification = CustomerContent;
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
        anbertCoursesSetup: record "anbert Courses Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin
            anbertCoursesSetup.Get();
            anbertCoursesSetup.TestField("Course Nos.");
            NoSeriesManagement.InitSeries(anbertCoursesSetup."Course Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;

    end;

    procedure AssistEdit("OldanbertCourse": Record "anbert Course") Result: Boolean
    var
        // IsHandled: Boolean;
        anbertCoursesSetup: record "anbert Courses Setup";
        anbertCourse: record "anbert Course";
        NoSeriesManagement: Codeunit NoSeriesManagement;


    begin
        // IsHandled := false;
        // OnBeforeAssistEdit(Rec, OldRes, IsHandled, Result);
        // if IsHandled then
        //     exit;


        anbertCourse := Rec;
        anbertCoursesSetup.Get();
        anbertCoursesSetup.TestField("Course Nos.");
        if NoSeriesManagement.SelectSeries(anbertCoursesSetup."Course Nos.", "OldanbertCourse"."No. Series", anbertCourse."No. Series") then begin
            anbertCoursesSetup.Get();
            anbertCoursesSetup.TestField("Course Nos.");
            NoSeriesManagement.SetSeries("No.");
            Rec := anbertCourse;
            exit(true);
        end;

    end;
}
