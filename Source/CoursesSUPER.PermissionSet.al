permissionset 50900 "anbert CoursesSUPER"
{
    Caption = 'Courses SUPER', comment = 'ESP="Cursos SUPER"';
    Assignable = true;
    //IncludedPermissionSets = ; // Heredar permisos de otro conjunto que se suman
    Permissions =
        tabledata "anbert Course" = RIMD, //mayusculas permiso directo, minusculas indirecto (actualiar indirectamente la 
        table "anbert Course" = X,
        table "anbert Course Edition" = X,
        tabledata "anbert Course Edition" = RMID,
        table "anbert Courses Setup" = X,
        tabledata "anbert Courses Setup" = RMID,
        page "anbert Course Card" = X,
        page "anbert Course Editions" = X,
        page "anbert Course Editions FactBox" = X,
        page "anbert Course List" = X,
        page "anbert Courses Setup" = X;
}

