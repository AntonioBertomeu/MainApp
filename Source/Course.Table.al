table 50900 Course
{
    CaptionML = ENU = 'Course', ESP = 'Curso';

    fields
    {
        field(1; "No."; Code[20]) { CaptionML = ENU = 'No.', ESP = 'Nº'; }
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
        field(8; Type; Enum "Course Type") { CaptionML = ENU = 'Course Type', ESP = 'Tipo Curso'; }
        field(7; "Language Code"; Code[10])
        {
            CaptionML = ENU = 'Language Code', ESP = 'Idioma Curso';
            TableRelation = Language;
        }
    }

}