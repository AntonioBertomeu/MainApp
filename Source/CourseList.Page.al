page 50900 "anbert Course List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "anbert Course";
    Editable = false;

    CaptionML = ENU = 'Course List', ESP = 'Lista Cursos';

    CardPageId = "anbert Course Card";
    layout
    {
        area(Content)
        {
            repeater(RepeaterControl)
            {
                field("No."; Rec."No.") { ApplicationArea = All; }
                field(Name; Rec.Name) { ApplicationArea = All; }
                field("Duration (hours)"; Rec."Duration (hours)") { ApplicationArea = All; }
                field(Price; Rec.Price) { ApplicationArea = All; Visible = false; }
                field(Type; Rec.Type) { ApplicationArea = All; }
                field("Language Code"; Rec."Language Code") { ApplicationArea = All; }
            }

        }
    }


}