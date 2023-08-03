table 50900 "anbert Course"
{
    //Caption = 'Course', comment = 'ESP="Curso"';
    Caption = 'Course';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.', comment = 'ESP="Nº"';

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
        field(2; Name; text[100]) { Caption = 'Name', comment = 'ESP="Nombre Curso"'; }
        field(3; "Content Description"; text[2048]) { Caption = 'Content Description', comment = 'ESP="Descripción Curso"'; }
        field(4; "Duration (hours)"; Integer) { Caption = 'Duration (Hours)', comment = 'ESP="Duración (Horas)"'; }
        field(5; Price; Decimal) { Caption = 'Price', comment = 'ESP="Precio"'; }
        field(6; "Type (Option)"; Option)
        {
            Caption = 'Type (Option)', comment = 'ESP="Tipo (Opción)"';
            OptionMembers = " ","Intructor-Lead","Video Tutorial";
            OptionCaption = ' ,Instructor-Lead,Video Tutorial', comment = 'ESP=" ,Guiado profesor,Video tutorial"';
        }
        field(8; Type; Enum "anbert Course Type") { Caption = 'Course Type', comment = 'ESP="Tipo Curso"'; }
        field(7; "Language Code"; Code[10])
        {
            Caption = 'Language Code', comment = 'ESP="Idioma Curso"';
            TableRelation = Language;
            ValidateTableRelation = false; //Se puede rellenar a mano no comprueba la existencia
        }
        field(56; "No. Series"; Code[20])
        {
            Caption = 'No. Series', comment = 'ESP="No. Series"';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(51; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group', Comment = 'ESP="Grupo contable prod. gen."';
            TableRelation = "Gen. Product Posting Group";

            trigger OnValidate()
            var
                GenProductPostingGroup: Record "Gen. Product Posting Group";
            begin
                if xRec."Gen. Prod. Posting Group" <> rec."Gen. Prod. Posting Group" then
                    if GenProductPostingGroup.ValidateVatProdPostingGroup(GenProductPostingGroup, "Gen. Prod. Posting Group") then
                        rec.Validate("VAT Prod. Posting Group", GenProductPostingGroup."Def. VAT Prod. Posting Group");
            end;
        }
        field(58; "VAT Prod. Posting Group"; Code[20])
        {
            Caption = 'VAT Prod. Posting Group', Comment = 'ESP="Grupo contable IVA Prod."';
            TableRelation = "VAT Product Posting Group";
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
