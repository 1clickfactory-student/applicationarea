codeunit 50126 InstallCustomExtension
{
    Subtype = Install;
 trigger OnInstallAppPerCompany()
 var
     ExperienceTierSetup :Record "Experience Tier Setup";
     ApplicationAreaSetup: Record "Application Area Setup";
     ApplicationAreaMgtFacade: Codeunit "Application Area Mgmt. Facade";
 begin
     
     if ExperienceTierSetup.Get(CompanyName) then begin
         if ExperienceTierSetup.Essential then begin // to enable custom application area for essentials
            if ApplicationAreaSetup.Get(CompanyName) then begin
                ApplicationAreaSetup.CustomApplicationArea:=true;
                ApplicationAreaSetup.Basic:=true;
                ExperienceTierSetup.Modify;
            end;
            ApplicationAreaMgtFacade.SetupApplicationArea(); //for changes to be applied immediatly
         end;        
     end;
        
 end; 
}
