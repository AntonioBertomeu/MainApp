page 50901 "anbert Course Card"
{
    Caption = 'Course Card', comment = 'ESP="Ficha Curso"';
    PageType = Card;
    //ApplicationArea = All;
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

                    ApplicationArea = All;
                    ToolTip = 'Codigo', comment = 'ESP="Código"';
                    trigger OnAssistEdit()
                    begin
                        if rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;


                }

                field(Name; Rec.Name) { ApplicationArea = all; }
            }
            part(CourseEditions; "anbert Course Editions FactBox")
            {
                ApplicationArea = all;
                SubPageLink = "Course No." = field("No.");
            }

            group(Training)
            {
                Caption = 'Training', comment = 'ESP="Formacion"';
                field(Type; Rec.Type) { ApplicationArea = all; }
                field("Duration (hours)"; Rec."Duration (hours)") { ApplicationArea = all; }
                field("Language Code"; Rec."Language Code") { ApplicationArea = all; }
                field("Content Description"; Rec."Content Description") { ApplicationArea = All; }
            }
            group(Invoicing)
            {
                Caption = 'Invoicing', comment = 'ESP="Facturación"';
                field(Price; Rec.Price) { ApplicationArea = all; }
                field("Type (Option)"; Rec."Type (Option)") { ApplicationArea = all; }
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action(Editions)
            {
                ApplicationArea = all;
                Caption = 'Editions', comment = 'ESP="Ediciones"';
                Image = CodesList;
                RunObject = page "anbert Course Editions";
                RunPageLink = "Course No." = field("No.");
            }
        }
    }
}

