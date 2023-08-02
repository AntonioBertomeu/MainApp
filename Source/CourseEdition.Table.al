table 50902 "anbert Course Edition"
{
    Caption = 'Course Edition', comment = 'ESP="Edición Cursos"';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Course No."; Code[20])
        {
            Caption = 'Course No.', comment = 'ESP="No. Curso"';
            TableRelation = "anbert Course";
        }
        field(2; Edition; Code[20])
        {
            Caption = 'Edition', comment = 'ESP="Edición"';
        }
        field(3; "Start Date"; Date)
        {
            Caption = 'Start Date', comment = 'ESP="Fecha Inicio"';
        }
        field(4; "Max. Studetns"; Integer)
        {
            Caption = 'Max. Studetns', comment = 'ESP="No. Máx. Alumnos"';
        }
    }

    keys
    {
        key(Key1; "Course No.", Edition)
        {
            Clustered = true;
        }

    }


}