page 50904 "anbert Course Editions FactBox"
{
    Caption = 'Course Editions', comment = 'ESP="Ediciones cursos"';
    PageType = ListPart;
    UsageCategory = None;
    SourceTable = "anbert Course Edition";
    DataCaptionFields = "Course No.";

    layout
    {
        area(Content)
        {
            repeater(RepeaterControl)
            {
                field("Course No."; Rec."Course No.")
                {
                    ApplicationArea = All;
                    Visible = False;
                }
                field(Edition; Rec.Edition) { ApplicationArea = All; }
                field("Start Date"; Rec."Start Date") { ApplicationArea = All; }
                field("Max. Studetns"; Rec."Max. Studetns") { ApplicationArea = All; }
            }
        }

    }

}