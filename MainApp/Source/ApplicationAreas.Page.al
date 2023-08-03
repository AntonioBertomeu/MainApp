page 50905 "anbert Application Areas"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Application Area Setup";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Advanced; rec.Advanced)
                {
                    ApplicationArea = All;

                }
            }
        }
    }
}