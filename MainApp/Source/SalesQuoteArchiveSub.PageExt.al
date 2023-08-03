pageextension 50911 "anbert Sales Quote Archive Sub" extends "Sales Quote Archive Subform"

{
    layout
    {
        addafter("No.")
        {
            field("anbert Course edition"; Rec."anbert Course edition")
            {
                ApplicationArea = All;
            }
        }
    }
}