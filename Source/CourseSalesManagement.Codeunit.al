codeunit 50900 "anbert Course-Sales Management"
{

    [EventSubscriber(ObjectType::Table, Database::"Option Lookup Buffer", OnBeforeIncludeOption, '', false, false)]
    local procedure OnBeforeIncludeOption(OptionLookupBuffer: Record "Option Lookup Buffer" temporary; LookupType: Option; Option: Integer; var Handled: Boolean; var Result: Boolean; RecRef: RecordRef);
    begin
        if Option = enum::"Sales Line Type"::"anbert Course".AsInteger() then begin
            Handled := true;
            result := true;
        end;
    end;

    [EventSubscriber(ObjectType::Table, database::"Sales Line", 'OnAfterAssignFieldsForNo', '', false, false)]
    local procedure CopyFromCourse(var SalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header")
    //El procedure recoje las variables del evento al que se ha sucrito, hay que definirlas
    var
        Course: Record "anbert Course";
    begin
        //message('Se ejecuta el evento propio')
        Course.Get(SalesLine."No.");

        Course.TestField("Gen. Prod. Posting Group");
        SalesLine.Description := Course.Name;
        SalesLine."Gen. Prod. Posting Group" := Course."Gen. Prod. Posting Group";
        SalesLine."VAT Prod. Posting Group" := Course."VAT Prod. Posting Group";
        SalesLine."Allow Item Charge Assignment" := false;
        SalesLine."Unit Price" := course.Price;
        OnAfterAssignCourseValues(SalesLine, Course, SalesHeader); // eventos a suscribirse si interesa
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterAssignCourseValues(var SalesLine: Record "Sales Line"; Course: Record "anbert Course"; SalesHeader: Record "Sales Header")
    begin
    end;

}