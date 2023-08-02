pageextension 50901 "anbert Sales Invoice Subform" extends "Sales Invoice Subform"

{
    layout
    {
        addafter("No.")
        {
            field("anbert Course edition"; Rec."anbert Course edition")
            {
                ApplicationArea = All;
                Enabled = Mivariable;
            }
        }
        modify(Type)
        {
            trigger OnAfterValidate()
            begin
                Mivariable := rec.Type = rec.type::"anbert Course";
            end;
        }
    }

    trigger OnAfterGetRecord()

    begin

        Mivariable := rec.Type = rec.type::"anbert Course";

    end;


    var
        Mivariable: Boolean;

}