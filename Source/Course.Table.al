table 50900 Course
{

    fields
    {
        field(1; "No."; Code[20]) { }
        field(2; Name; text[100]) { }
        field(3; "Content Description"; text[2048]) { }
        field(4; "Duration (hours)"; Integer) { }
        field(5; Price; Decimal) { }
        field(6; "Type (Option)"; Option)
        {
            OptionMembers = " ","Intructor-Lead","Video Tutorial";
        }
        field(8; Type; Enum "COurse Type") { }
        field(7; "Language Code"; Code[10])
        {
            TableRelation = Language;
        }
    }

}