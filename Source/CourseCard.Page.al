page 50901 "anbert Course Card"
{
    CaptionML = ENU = 'Course Card', ESP = 'Ficha Curso';
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
                CaptionML = ENU = 'General', ESP = 'General';
                field("No."; Rec."No.")
                {

                    ApplicationArea = All;
                    ToolTipML = ENU = 'Codigo', ESP = 'Código';
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
                CaptionML = ENU = 'Training', ESP = 'Formacion';
                field(Type; Rec.Type) { ApplicationArea = all; }
                field("Duration (hours)"; Rec."Duration (hours)") { ApplicationArea = all; }
                field("Language Code"; Rec."Language Code") { ApplicationArea = all; }
                field("Content Description"; Rec."Content Description") { ApplicationArea = All; }
            }
            group(Invoicing)
            {
                CaptionML = ENU = 'Invoicing', ESP = 'Facturación';
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
                CaptionML = ENU = 'Editions', ESP = 'Ediciones';
                Image = CodesList;
                RunObject = page "anbert Course Editions";
                RunPageLink = "Course No." = field("No.");
            }
        }
    }
}

