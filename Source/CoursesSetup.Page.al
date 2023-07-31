page 50902 "anbert Courses Setup"
{
    AccessByPermission = TableData "anbert Course" = R;
    ApplicationArea = Jobs;
    CaptionML = ENU = 'Courses Setup', ESP = 'Conf. Cursos';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "anbert Courses Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(Numbering)
            {
                CaptionML = ENU = 'Numbering', ESP = 'Numeración';
                field("Course Nos."; Rec."Course Nos.")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the number series code you can use to assign numbers to Courses.';
                }

#if not CLEAN22
#endif
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    trigger OnOpenPage()
    begin
        rec.Reset();
        if not rec.Get() then begin
            rec.Init();
            rec.Insert();
        end;
    end;
}

