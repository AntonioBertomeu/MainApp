permissionset 50901 "anbert CoursesInd"
{
    Caption = 'Courses Indirect', comment = 'ESP="Cursos Indirect"';
    Assignable = true;
    //IncludedPermissionSets = ; // Heredar permisos de otro conjunto que se suman
    Permissions = tabledata "anbert Course" = rimd, //mayusculas permiso directo, minusculas indirecto (actualiar indirectamente la 
        table "anbert Course" = x,
        table "anbert Course Edition" = x,
        tabledata "anbert Course Edition" = rimd,
        table "anbert Courses Setup" = x,
        tabledata "anbert Courses Setup" = rimd,
        page "anbert Course Card" = x,
        page "anbert Course Editions" = x,
        page "anbert Course Editions FactBox" = x,
        page "anbert Course List" = x,
        page "anbert Courses Setup" = x;

}