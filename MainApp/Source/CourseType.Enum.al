enum 50900 "anbert Course Type"
{
    Caption = 'Course Type ', comment = 'ESP="Tipo Curso "';
    Extensible = true;

    value(0; " ") { Caption = ' ', comment = 'ESP=" "'; }
    value(1; "Instruct-Lead") { Caption = 'Instruct-Lead ', comment = 'ESP="Instructor"'; }
    value(2; "Video Tutotial") { Caption = 'Video Tutorial ', comment = 'ESP="Video Tutorial "'; }
}