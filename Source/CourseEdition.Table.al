table 50902 "anbert Course Edition"
{
    CaptionML = ENU = 'Course Edition', ESP = 'Edición Cursos';

    fields
    {
        field(1; "Course No."; Code[20])
        {
            CaptionML = ENU = 'Course No.', ESP = 'No. Curso';
            TableRelation = "anbert Course";
        }
        field(2; Edition; Code[20])
        {
            CaptionMl = ENU = 'Edition', ESP = 'Edición';
        }
        field(3; "Start Date"; Date)
        {
            CaptionML = ENU = 'Start Date', ESP = 'Fecha Inicio';
        }
        field(4; "Max. Studetns"; Integer)
        {
            CaptionML = ENU = 'Max. Studetns', ESP = 'No. Máx. Alumnos';
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