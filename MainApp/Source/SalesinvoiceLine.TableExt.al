tableextension 50902 "anbert Sales invoice Line" extends "Sales invoice Line"
{

    fields
    {
        // Add changes to table fields here
        modify("No.")
        {
            TableRelation = if (Type = const("anbert Course")) "anbert Course";
        }
        field(50900; "anbert Course edition"; code[20])
        {
            Caption = 'Course Edition', comment = 'ESP="Edición Curso"';
            DataClassification = CustomerContent;
            TableRelation = "anbert Course Edition".Edition where("Course No." = field("No."));

        }
    }
}