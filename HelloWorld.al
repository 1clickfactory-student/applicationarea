// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50125 CustomerListExt extends "Customer List"
{
    var 
        EnableExampleUserExperience :Codeunit EnableExampleUserExperience;

    trigger OnOpenPage();
    begin
        if EnableExampleUserExperience.IsExampleApplicationAreaEnabled then
            Message('App published: Hello world from custom Application area');
    end;
    
     
}





