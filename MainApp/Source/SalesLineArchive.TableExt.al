tableextension 50905 "anbert Sales Line Archive" extends "Sales Line Archive"
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
