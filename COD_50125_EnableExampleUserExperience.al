codeunit 50125 EnableExampleUserExperience
{
    trigger OnRun();
    begin
    end;
    
[EventSubscriber(ObjectType::Codeunit, 9178, 'OnSetExperienceTier', '', true, true)]
local procedure SetExampleCustomUserExperienceApplicationAreas(ExperienceTierSetup:  Record "Experience Tier Setup"; var TempApplicationAreaSetup: record "Application Area Setup"; var ApplicationAreasSet: Boolean);
//Setting Application areas for Custom user experience
  
begin

    if ExperienceTierSetup.ExampleCustomUserExperience then begin 
            TempApplicationAreaSetup.CustomApplicationArea:=true;
            TempApplicationAreaSetup.XBRL:=true;
            TempApplicationAreaSetup.Basic:=true;
            ApplicationAreasSet:=true;
    end;
end;    

[EventSubscriber(ObjectType::Codeunit, 9178, 'OnValidateApplicationAreas', '', true, true)]
 local procedure VerifyApplicationAreasOnValidateApplicationAreas(ExperienceTierSetup: Record "Experience Tier Setup"; TempApplicationAreaSetup: Record "Application Area Setup" temporary)
begin
    // if ExperienceTierSetup.Essential then
    //     if not TempApplicationAreaSetup.CustomApplicationArea then
    //       //  Error('Example App Area should be part of Essential in order for the Example Extension to work.');
end;

procedure IsExampleApplicationAreaEnabled():Boolean;
var
    ApplicationAreaSetup: Record "Application Area Setup";
    ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
begin
     if ApplicationAreaMgmtFacade.GetApplicationAreaSetupRecFromCompany(ApplicationAreaSetup, CompanyName()) then
        exit(ApplicationAreaSetup.CustomApplicationArea);
end;


}
