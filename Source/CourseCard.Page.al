page 50901 "anbert Course Card"
{
    Caption = 'Course Card', comment = 'ESP="Ficha Curso"';
    PageType = Card;
    //ApplicationArea =  Basic, Suite, Jobs;
    ApplicationArea = all;

    UsageCategory = None;
    SourceTable = "anbert Course";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General', comment = 'ESP="General"';
                field("No."; Rec."No.")
                {


                    ToolTip = 'Codigo', comment = 'ESP="Código"';
                    trigger OnAssistEdit()
                    begin
                        if rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;


                }

                field(Name; Rec.Name) { }
            }
            part(CourseEditions; "anbert Course Editions FactBox")
            {
                SubPageLink = "Course No." = field("No.");
            }

            group(Training)
            {
                Caption = 'Training', comment = 'ESP="Formacion"';
                field(Type; Rec.Type) { }
                field("Duration (hours)"; Rec."Duration (hours)") { }
                field("Language Code"; Rec."Language Code") { }
                field("Content Description"; Rec."Content Description") { }
            }
            group(Invoicing)
            {
                Caption = 'Invoicing', comment = 'ESP="Facturación"';
                field(Price; Rec.Price) { }
                field("Type (Option)"; Rec."Type (Option)") { }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group") { }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group") { }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(Editions)
            {
                Caption = 'Editions', comment = 'ESP="Ediciones"';
                Image = CodesList;
                RunObject = page "anbert Course Editions";
                RunPageLink = "Course No." = field("No.");
            }
        }
    }
}

