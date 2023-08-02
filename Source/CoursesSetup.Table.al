table 50901 "anbert Courses Setup"
{
    Caption = 'Courses Setup', comment = 'ESP="Conf. Cursos"';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = SystemMetadata;
        }
        field(2; "Course Nos."; Code[20])
        {
            Caption = 'Course Nos.', comment = 'ESP="Curso Nos."';
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }
}

