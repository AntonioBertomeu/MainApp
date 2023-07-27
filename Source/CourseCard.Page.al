page 50901 "Course Card"
{
    CaptionML = ENU = 'Course Card', ESP = 'Ficha Curso';
    PageType = Card;
    //ApplicationArea = All;
    UsageCategory = None;
    SourceTable = Course;

    layout
    {
        area(Content)
        {
            group(General)
            {
                CaptionML = ENU = 'General', ESP = 'General';
                field("No."; Rec."No.") { ApplicationArea = All; }
                field(Name; Rec.Name) { ApplicationArea = all; }
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
}
