tableextension 50903 "anbert Sales Cr.Memo Line" extends "Sales Cr.Memo Line"
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