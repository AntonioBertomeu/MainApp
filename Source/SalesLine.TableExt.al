tableextension 50900 "anbert Sales Line" extends "Sales Line"
{

    fields
    {
        // Add changes to table fields here
        modify("No.")
        {
            TableRelation = if (Type = const("anbert Course")) "anbert Course";
        }
    }
}