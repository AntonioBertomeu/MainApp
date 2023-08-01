page 50903 "anbert Course Editions"
{
    CaptionML = ENU = 'Course Editions', ESP = 'Ediciones cursos';
    PageType = List;
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
                    Visible = false;
                }
                field(Edition; Rec.Edition) { ApplicationArea = All; }
                field("Start Date"; Rec."Start Date") { ApplicationArea = All; }
                field("Max. Studetns"; Rec."Max. Studetns") { ApplicationArea = All; }
            }
        }

    }

}