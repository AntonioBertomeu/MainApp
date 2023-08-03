pageextension 50910 "anbert Sales Order Archive Sub" extends "Sales Order Archive Subform"

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