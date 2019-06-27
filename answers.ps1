###############################################################
## Environment and client stuff.                             ##
###############################################################
### New comment ###
$clientName				= "ZGEN"	# This used to seed the config settings, database names, etc. So don't use characters like %,* , <> and so on...
$envType				= "QA"		# Only use Demo, Demo, CERT and PROD here so we can keep things consistant. 
$baseDeploymentPath 	= [string]::Format("{0}_{1}", $clientName, $envType)
$basePackagePath		= (Get-Item (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)).parent.fullname # If you comment out the apppath, make sure there's a slash at the end of this.
$appServer				= "slc-med-app5" # This is used for services and web apps.
$databaseServer			= "slc-med-db5a" 
$clientPackagePath      = (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent) #[string]::Format("{0}\{1}_{2}\",$basePackagePath, $clientName, $envType)
$baseAppPath			= "\\slc-med-app5\e$\Medicity\ZGEN\$baseDeploymentPath"
$localAppPath			= "\\slc-med-app5\e$\Medicity\ZGEN\$baseDeploymentPath"
$baseWebPath			= "\\slc-med-web7\e$\Medicity\ZGEN\"
$localWebPath			= "\\slc-med-app5\e$\Medicity\ZGEN\$baseDeploymentPath"
$databaseUser       	= "devapp5sa@medicity.com"
$databasePass       	= ""
$webAppPath				= [string]::Format("{0}\{1}_{2}\",$baseWebPath, $clientName, $envType)
$deployAppPath          = $baseAppPath
$deployWebPath          = $webAppPath
$nexusPackagesPath		= [string]::Format("{0}\{1}_{2}\Nexus", $baseAppPath, $clientName, $envType)
$webPackagesPath		= Join-Path $basePackagePath "web"
$paDeployPath			= Join-Path $webAppPath "ProAccess"
$pamaintDeployPath		= Join-Path $webAppPath "PAMaint"
$cdrMainToolDeployPath	= Join-Path $webAppPath "CDRMaintenanceTool"
$nexusManagerDeployPath	= Join-Path $webAppPath "NexusManager"
$autoPrintWSDeployPath	= Join-Path $webAppPath "AutoPrintWebService"
$createUserName 		= [string]::Format("{0}_{1}_User",$clientName, $envType) # This is the SQL user created with SQL_UserCreation.ps1
$createdSqlUserPass 	= ""	# This is the password used for the logins created with SQL_UserCreation.ps1.  Leave both sets of quotes.
$directWebmailURL       = "https://medicityqa.com/webmail/"
$directMailSMTPServer   = "medicityqa.com"
$directMailSMTPPort     = "25"
$pamaintURL             = "http://zgen-qa-web/pamaint"

###############################################################
## Service and database names                                ##
###############################################################
$medilogServiceName		= [string]::Format("{0}_{1}_MediLog",	$clientName,$envType)
$rmiServiceName		    = [string]::Format("{0}_{1}_RMI",		$clientName,$envType)
$mpiServiceName			= [string]::Format("{0}_{1}_MPI",		$clientName,$envType)
$liliServiceName		= [string]::Format("{0}_{1}_LILI",		$clientName,$envType)
$rmsServiceName			= [string]::Format("{0}_{1}_RMS",		$clientName,$envType)
$jadrServiceName        = [string]::Format("{0}_{1}_JADR",      $clientName, $envType)
$reportServiceName		= [string]::Format("{0}_{1}_Reports",	$clientName,$envType)
$termServiceName 		= [string]::Format("{0}_{1}_Terminology",$clientName,$envType)
$taskServiceName        = [string]::Format("{0}_{1}_TaskManager",$clientName,$envType)
$affgatServiceName      = [string]::Format("{0}_{1}_AffinityGateway",$clientName,$envType)
$referralServiceName    = [string]::Format("{0}_{1}_PatientReferral", $clientName, $envType)
$referralProgressServiceName = [string]::Format("{0}_{1}_ReferralProgressReport", $clientName, $envType)

$mediLogDatabaseName	= [string]::Format("{0}_{1}_MediLog",	    $clientName,$envType)
$mpiDatabaseName		= [string]::Format("{0}_{1}_MPI",		    $clientName,$envType)
$padDatabaseName		= [string]::Format("{0}_{1}_PAD",		    $clientName,$envType)
$workListsDatabaseName	= [string]::Format("{0}_{1}_Worklists",	    $clientName,$envType)
$liliDatabaseName		= [string]::Format("{0}_{1}_LILI",		    $clientName,$envType)
$reportingDatabaseName	= [string]::Format("{0}_{1}_Reporting",	    $clientName,$envType)
$appConfigDatabaseName = [string]::Format("{0}_{1}_Configuration",	    $clientName,$envType)
$communityDatabaseName  = [string]::Format("{0}_{1}_Community",	    $clientName,$envType)
$termDatabaseName		= [string]::Format("{0}_{1}_Terminology",   $clientName,$envType)
$registryDatabaseName   = [string]::Format("{0}_{1}_Registry",      $clientName,$envType)
$rmiDatabaseName        = [string]::Format("{0}_{1}_RMI",           $clientName,$envType)
$nexusDatabaseName      = [string]::Format("{0}_{1}_NexusEngine",   $clientName,$envType)
$jadrDatabaseName       = [string]::Format("{0}_{1}_JADR",        $clientName, $envType)
$referralDatabaseName   = [string]::Format("{0}_{1}_PatientReferral", $clientName, $envType)

###############################################################
## Home Community Name                                       ##
###############################################################
$homeCommunity = "Community Installation"

###############################################################
## CDR Database Settings                                     ##
###############################################################
$cdrDatabaseServer			= $databaseServer
$cdrDatabaseUser			= [string]::Format("{0}_{1}_User",$clientName, $envType)
$cdrDatabaseUserPassword	= $createdSqlUserPass
$cdrMainToolURL 			= "http://zgen-qa-web/CDRMaintenance/Maintenance/Maintenance.aspx" # Update this to whatever your DNS name will be for the CDR Maint tool website

###############################################################
## Array of all CDR's and that need to be created            ##
###############################################################
$cdrArray = ("Community", "CC", "CTY", "LC")

###############################################################
## Array of Nexus Engine Databases to create                 ##
###############################################################
$nexusEngineArray = ("Nexus")

###############################################################
## Database script and misc paths.                           ##
###############################################################
$nexusSqlPath 		= [string]::Format("{0}\Database\NexusEngine\nexusengine_full_creation.sql",$basePackagePath)
$padSqlPath 		= [string]::Format("{0}\Database\PAD",$basePackagePath)
$worklistsSqlPath	= [string]::Format("{0}\Database\Worklists",$basePackagePath)
$reportingSqlPath	= [string]::Format("{0}\Database\Reporting",$basePackagePath)
$piSqlPath			= [string]::Format("{0}\Database\CDR\PostInstall",$basePackagePath)
$codesetsPath		= [string]::Format("{0}\Database\CDR\Codesets",$clientPackagePath)
$medilogSqlPath		= [string]::Format("{0}\Database\Medilog",$basePackagePath)
$mpiSqlPath			= [string]::Format("{0}\Database\MPI",$basePackagePath)
$terminologySqlPath = [string]::Format("{0}\Database\Terminology",$basePackagePath)
$mediLogFilePath 	= Join-Path $localAppPath "\Log"
$prefix				= [string]::Format("{0}_{1}", $clientName, $envType)

###############################################################
## Standardized configs, change as needed                    ##
###############################################################
$autoPrintReposName = [string]::Format("{0}_{1}", $prefix, "Community_Data")

###############################################################
## PATHS - Web and App.                                      ##
###############################################################
$paAppPath			= Join-Path $webAppPath "ProAccess"
$pamaintAppPath		= Join-Path $webAppPath "PAMaint"
$nmAppPath			= Join-Path $webAppPath "NexusManager"
$apwsAppPath		= Join-Path $webAppPath "AutoPrintWebService"
$cdrmaintoolAppPath = Join-Path $webAppPath "CDRMaintenanceTool"
$mediLogAppPath		= Join-Path $baseAppPath "MediLog"
$rmsAppPath			= Join-Path $baseAppPath "RMS_CDRProv_{0}"
$jadrAppPath        = Join-Path $baseAppPath "RMS_JADRProv"
$rmiAppPath			= Join-Path $baseAppPath "RMI"
$mpiAppPath			= Join-Path $baseAppPath "MPI"
$liliAppPath		= Join-Path $baseAppPath "LILI"
$parptsAppPath		= Join-Path $baseAppPath "PARPTS"
#$termAppPath		= Join-Path $baseAppPath "Terminology"
$taskAppPath		= Join-Path $baseAppPath "TaskManager"
$affgatAppPath		= Join-Path $baseAppPath "AffinityGateway"
$referralAppPath    = Join-Path $baseAppPath "PatientReferralService"
$referralProgressAppPath    = Join-Path $baseAppPath "ReferralProgressReport"

$localpaAppPath				= Join-Path $localWebPath "ProAccess"
$localpamaintAppPath		= Join-Path $localWebPath "PAMaint"
$localnmAppPath				= Join-Path $localWebPath "NexusManager"
$localapwsAppPath			= Join-Path $localWebPath "AutoPrintWebService"
$localcdrmaintoolAppPath 	= Join-Path $localWebPath "CDRMaintenanceTool"
$localmediLogAppPath		= Join-Path $localAppPath "MediLog"
$localrmsAppPath			= Join-Path $localAppPath "RMS_CDRProv_{0}"
$localJadrAppPath           = Join-Path $localAppPath "RMS_JADRProv"
$localRmiAppPath			= Join-Path $localAppPath "RMI"
$localmpiAppPath			= Join-Path $localAppPath "MPI"
$localliliAppPath			= Join-Path $localAppPath "LILI"
$localparptsAppPath			= Join-Path $localAppPath "PARPTS"
#$localtermAppPath			= Join-Path $localAppPath "Terminology"
$localtaskAppPath			= Join-Path $localAppPath "TaskManager"
$localAffgatAppPath		    = Join-Path $localAppPath "AffinityGateway"
$localReferralAppPath       = Join-Path $localAppPath "PatientReferralService"

$deploypaAppPath			= Join-Path $deployWebPath "ProAccess"
$deploypamaintAppPath		= Join-Path $deployWebPath "PAMaint"
$deploynmAppPath			= Join-Path $deployWebPath "NexusManager"
$deployapwsAppPath			= Join-Path $deployWebPath "AutoPrintWebService"
$deploycdrmaintoolAppPath 	= Join-Path $deployWebPath "CDRMaintenanceTool"
$deploymediLogAppPath		= Join-Path $deployAppPath "MediLog"
$deployrmsAppPath			= Join-Path $deployAppPath "RMS_CDRProv_{0}"
$deployjadrAppPath          = Join-Path $deployAppPath "RMS_JADRProv"
$deployrmiAppPath			= Join-Path $deployAppPath "RMI"
$deploympiAppPath			= Join-Path $deployAppPath "MPI"
$deployliliAppPath			= Join-Path $deployAppPath "LILI"
$deployparptsAppPath		= Join-Path $deployAppPath "PARPTS"
#$deploytermAppPath			= Join-Path $deployAppPath "Terminology"
$deploytaskAppPath			= Join-Path $deployAppPath "TaskManager"
$deployAffgatAppPath	    = Join-Path $deployAppPath "AffinityGateway"
$deployReferralAppPath      = Join-Path $deployAppPath "PatientReferralService"
$deployReferralProgressAppPath     = Join-Path $deployAppPath "ReferralProgressReport"

###############################################################
## RMI							                             ##
###############################################################
$rmiPatientIndexPath = Join-Path $localRmiAppPath "patient_index"
$rmiRecordIndexPath = Join-Path $localRmiAppPath "record_index"
$envScope = [string]::Format("http://www.medicity.com/2012/03/RecordManagementService/scope/{0}_{1}", $clientName, $envType)

###############################################################
## Internal local file paths                                 ##
###############################################################
if ( $aggAppPath -ne $null ) { $aggEndpointsFile = Join-Path $localaggAppPath "endpoints.xml" }
$mpiCrossRefMap = [string]::Format("{0}\NameXRef.xml",$localmpiAppPath)
$OIDMap 		= "e:\medicity\ZGEN\OID\OidMaps.xml" #[string]::Format("{0}\OIDMaps\OidMaps.xml",$localAppPath)

###############################################################
## MediLog log paths, if needed                              ##
###############################################################
$rmsLogFile			= Join-Path $mediLogFilePath "RMS_CdrProv_{0}"
$rmiLogFile			= Join-Path $mediLogFilePath "RMI_{0:yyyyMMdd}.log"
$mpiLogFile			= Join-Path $mediLogFilePath "MPI_{0:yyyyMMdd}.log"
$liliLogFile		= Join-Path $mediLogFilePath "LILI_{0:yyyyMMdd}.log"
$parptsLogFile		= Join-Path $mediLogFilePath "PARPTS_{0:yyyyMMdd}.log"
$mediLogLogFile		= Join-Path $mediLogFilePath "MediLog_{0:yyyyMMdd}.log"
$autoPrintLogFile	= Join-Path $mediLogFilePath "AutoPrint_{0:yyyyMMdd}.log"
$cdrMaintLogFile	= Join-Path $mediLogFilePath "CDRMaint_{0:yyyyMMdd}.log"
$taskLogFile		= Join-Path $mediLogFilePath "TaskManager_{0:yyyMMdd}.log"

###############################################################
## Keys, GUID                                                ##
###############################################################
#MediLog Keys
$PAKey 			    = "E4EC0E7C-45BE-E611-8D45-E4115BED1D36"
$FaxSenderKey 		= "752c51d0-88ec-42f2-8cff-433a284644f5"
$mpiKey 			= "3b18df34-d8d7-402d-88ba-d581c9802415"
$liliKey 			= "982d1d14-92bd-44f7-80c2-585cd6e5b5d5"
$autoPrintwssKey	= "E4EC0E7C-45BE-E611-8D45-E4115BED1D36"
$taskManagerKey		= "78C47F92-9DAF-494C-9CDF-E0A2B2A6ADA0"

$mediLogKey = $mpiKey

###############################################################
## Database Connection Strings                               ##
###############################################################
#ConnectionStrings (RMS specific connectionsstrings are listed below in the RMS section)
$mediLogConnectionString	= [string]::Format("server={0};Integrated Security=SSPI;database={1};app=MediLog",$databaseServer,$mediLogDatabaseName)
$mpiConnectionString		= [string]::Format("server={0};Integrated Security=SSPI;database={1};app=MPI",$databaseServer,$mpiDatabaseName)
$padConnectionString		= [string]::Format("server={0};Integrated Security=SSPI;database={1};connect timeout=180;app=LILI",$databaseServer,$padDatabaseName)
$reportConnectionString		= [string]::Format("server={0};Integrated Security=SSPI;database={1};connect timeout=180;app=Medicity PAReport",$databaseServer,$reportingDatabaseName)
$worklistConnectionString 	= [string]::Format("server={0};Integrated Security=SSPI;database={1};connect timeout=180;app=Worklists",$databaseServer,$workListsDatabaseName)
$cdrConnectionString        = [string]::Format("server={0};Integrated Security=SSPI;trusted_connection=true;database={1};connect timeout=180;app=CommunityCDR",$databaseServer,$communityDatabaseName)
$termConnectionString		= [string]::Format("server={0};Integrated Security=SSPI;trusted_connection=true;database={1};connect timeout=180;app=Terminology Service",$databaseServer,$termDatabaseName)
$emrConnectionString 		= "server=slc-med-db5;Integrated Security=SSPI;database=ZGEN_QA_FileTransferWebService;connect timeout=180;app=Medicity ProAccess"
$parptsVGACConnectionString = [string]::Format("data source={0}\sql_lite_vgac.db;version=3;pooled=true;max pool size=20;synchronous=off;", $localparptsAppPath)
$registryConnectionString   = [string]::Format("metadata=res://*/Medicity.CommunityServices.Model.RegistryModel.SqlServer.ssdl|res://*/RegistryModel.csdl|res://*/RegistryModel.msl;provider=System.Data.SqlClient;provider connection string=&quot;Data Source={0};Initial Catalog={1};Integrated Security=SSPI;MultipleActiveResultSets=True&quot;",$databaseServer,$registryDatabaseName)
$rmiConnectionString 		= [string]::Format("server={0};Integrated Security=SSPI;trusted_connection=true;database={1};connect timeout=180;app=RMI",$databaseServer,$rmiDatabaseName)
$referralConnectionString 	= [string]::Format("server={0};Integrated Security=SSPI;trusted_connection=true;database={1};connect timeout=180;app=PatientReferralService",$databaseServer,$referralDatabaseName)
###############################################################
## Service Port Numbers.                                     ##
## RMS specific ports are in the RMS section         ##
## listed below in the RMS section).                 ##
###############################################################
$nexusEngine1Port		= "12100"	# Add more as needed, notice the number 1. 
$rmiTcpPort				= "12050"
$parptsTcpPort			= "12004"
$parptsHttpPort			= "12005"
$liliTcpPort			= "12006"
$liliHttpPort			= "12007"
$mediLogWriterPort		= "12002"
$mediLogReaderPort		= "12003"
$mpiTcpPort				= "12008"
#$mpiHttpPort			= "12"
#$meiAdminHttpPort		= "12009"
$meiAdminTcpPort		= "12010"
$termTcpPort			= "12011"
#$termHttpPort           = "12"
$taskManagerHttpPort    = "12017"
$taskManagerTcpPort     = "12012"
$affgatHttpPort         = "12200"
$affgatHttpsPort        = "12014"
$referralHttpPort       = "12015"
$jadrTcpPort            = "12016"
$syslogPort             = "12070"

#Legacy Services (soon to be depricated)
$aggDRSTcpPort			= "12900"
$aggProviderGUID 		= "{81328c80-c68f-4e43-bff4-7c6f68a7fab9}"
$aggAppPath				= Join-Path $baseAppPath "DRS_AggProv"
$localaggAppPath		= Join-Path $localAppPath "DRS_AggProv"
$deployaggAppPath		= Join-Path $deployAppPath "DRS_AggProv"
$aggProvServiceName		= [string]::Format("{0}_{1}_AggProv",		 $clientName,$envType)
$aggDrsTcpURI			= [string]::Format("net.tcp://{0}:{1}/RecordLocator",			$appServer, $aggDRSTcpPort)

$drsAppPath				= Join-Path $baseAppPath "DRS_CDRProv"
$localdrsAppPath		= Join-Path $localAppPath "DRS_CDRProv"
$deploydrsAppPath		= Join-Path $deployAppPath "DRS_CDRProv"
$drsServiceName         = [string]::Format("{0}_{1}_CDRProv"		,$clientName,$envType)



###############################################################
## URIs. RMS specific are in the RMS section)        ##
###############################################################
$mediLogWriterTcpURI	= [string]::Format("net.tcp://{0}:{1}/MediLogger",				$appServer, $mediLogWriterPort)
$mediLogWriterHttpURI	= [string]::Format("http://{0}:{1}/MediLogger",					$appServer, $mediLogWriterPort)
$mediLogReaderTcpURI	= [string]::Format("net.tcp://{0}:{1}/MediLogReader",			$appServer, $mediLogReaderPort)
$mpiTcpURI				= [string]::Format("net.tcp://{0}:{1}/MPI", 					$appServer, $mpiTcpPort)
$mpiHttpURI             = [string]::Format("http://{0}:{1}/MPI",                        $appServer, $mpiHttpPort)
$mpiPMTcpURI            = [string]::Format("net.tcp://{0}:{1}/PatientManagement",       $appServer, $mpiTcpPort)
$liliHttpURI			= [string]::Format("http://{0}:{1}/LILI",						$appServer, $liliHttpPort)
$parptsTcpURI			= [string]::Format("net.tcp://{0}:{1}/ProAccessReports",		$appServer, $parptsTcpPort)
$parptsHttpURI			= [string]::Format("http://{0}:{1}/ProAccessReports",			$appServer, $parptsHttpPort)
$meiHttpURI				= [string]::Format("http://{0}:{1}/MEIAdmin",					$appServer, $meiAdminHttpPort)
$meiTcpURI				= [string]::Format("net.tcp://{0}:{1}/MEIAdmin",				$appServer, $meiAdminTcpPort)

$termHttpURI			= [string]::Format("http://{0}:{1}/TerminologyService",			$appServer, $termHttpPort)
$termTcpURI				= [string]::Format("net.tcp://{0}:{1}/TerminologyService",		$appServer, $termTcpPort)
$taskManagerHttpURI		= [string]::Format("http://{0}:{1}/TaskManagerService",			$appServer, $taskManagerHttpPort)
$taskManagerTcpURI		= [string]::Format("net.tcp://{0}:{1}/TaskManagerService",		$appServer, $taskManagerTcpPort)
$nexusManagerConnStrs 	= [array](([string]::Concat($appServer,":",$nexusEngine1Port))) ## You can add mutiple Nexus engines to this, that's why it's in an array, silly pants.
$nexus1EngineURL 		= [string]::Format("tcp://{0}/EngineController", $nexusManagerConnStrs)

$rmiTcpURI				= [string]::Format("net.tcp://{0}:{1}/RecordIndex", 			$appServer, $rmiTcpPort)
$jadrRMTcpURI           = [string]::Format("net.tcp://{0}:{1}/RecordManagement",      $appServer, $jadrTcpPort)
$referralHttpURI		= [string]::Format("http://{0}:{1}/PatientReferralService",  $appServer, $referralHttpPort)

#TEMP until refactor
#$dfsTcpURI = "net.tcp://zgen-dev-app:41101/DataService/DataForwarder"

# Affinity Gateway services
$affgatPIXHttpURI             = [string]::Format("http://{0}:{1}/pix",$appServer, $affgatHttpPort)
$affgatPIXHttpsURI            = [string]::Format("https://{0}:{1}/pix",$appServer, $affgatHttpsPort)
$affgatXDSReposHttpURI        = [string]::Format("http://{0}:{1}/xcaresponding/retrieve/saml",$appServer, $affgatHttpPort)
$affgatXDSReposHttpsURI       = [string]::Format("https://{0}:{1}/xdsrepository",$appServer, $affgatHttpsPort)
$affgatXDSRegistryHttpURI     = [string]::Format("http://{0}:{1}/xcaresponding/query/saml",$appServer, $affgatHttpPort)
$affgatXDSRegistryHttpsURI    = [string]::Format("https://{0}:{1}/xdsregistry",$appServer, $affgatHttpsPort)
$affgatXCPDHttpURI            = [string]::Format("https://{0}:{1}/xpcd",$appServer, $affgatHttpsPort)

###############################################################
## LuceneIndexProvider                                       ##
###############################################################
$lucenePath = $localmpiAppPath + "\Index"
$luceneIndexConnectionString = [string]::Format("db_connstr={0}|path={1}|timeout=180|sync_delay=60", $mpiConnectionString, $lucenePath)

###############################################################
##CDR Connections                                            ##
###############################################################
$cdrConnStrs = @{}
$cdrConnStrs.Add([string]::Format("{0}_{1}_CDR_Community", $clientName, $envType),
	@{	name = [string]::Format("{0}_{1}_CDR_Community", $clientName, $envType);
		providerName = "System.Data.SqlClient";
		connectionString = [string]::Format("server={0};database={1}_{2}_CDR_Community;Integrated Security=SSPI;connect timeout=180;app=Medicity ProAccess;Asynchronous Processing=true", $databaseServer, $clientName, $envtype);
	} ) 
$cdrConnStrs.Add([string]::Format("{0}_{1}_CDR_CC", $clientName, $envType),
	@{	name = [string]::Format("{0}_{1}_CDR_CC", $clientName, $envType);
		providerName = "System.Data.SqlClient";
		connectionString = [string]::Format("server={0};database={1}_{2}_CDR_CC;Integrated Security=SSPI;connect timeout=180;app=Medicity ProAccess;Asynchronous Processing=true", $databaseServer, $clientName, $envtype);
	} ) 

$cdrConnStrs.Add([string]::Format("{0}_{1}_CDR_CTY", $clientName, $envType),
@{	name = [string]::Format("{0}_{1}_CDR_CTY", $clientName, $envType);
	providerName = "System.Data.SqlClient";
	connectionString = [string]::Format("server={0};database={1}_{2}_CDR_CTY;Integrated Security=SSPI;connect timeout=180;app=Medicity ProAccess;Asynchronous Processing=true", $databaseServer, $clientName, $envtype);
} ) 

$cdrConnStrs.Add([string]::Format("{0}_{1}_CDR_LC", $clientName, $envType),
	@{	name = [string]::Format("{0}_{1}_CDR_LC", $clientName, $envType);
		providerName = "System.Data.SqlClient";
		connectionString = [string]::Format("server={0};database={1}_{2}_CDR_LC;Integrated Security=SSPI;connect timeout=180;app=Medicity ProAccess;Asynchronous Processing=true", $databaseServer, $clientName, $envtype);
	} ) 

#$cdrConnStrs.Add([string]::Format("{0}_{1}_CDR_GP", $clientName, $envType),
#	@{	name = [string]::Format("{0}_{1}_CDR_GP", $clientName, $envType);
#		providerName = "System.Data.SqlClient";
#		connectionString = [string]::Format("server={0};database={1}_{2}_CDR_GP;Integrated Security=SSPI;connect timeout=180;app=Medicity ProAccess;Asynchronous Processing=true", $databaseServer, $clientName, $envtype);
#	} ) 

#$cdrConnStrs.Add([string]::Format("{0}_{1}_CDR_MPH", $clientName, $envType),
#	@{	name = [string]::Format("{0}_{1}_CDR_MPH", $clientName, $envType);
#		providerName = "System.Data.SqlClient";
#		connectionString = [string]::Format("server={0};database={1}_{2}_CDR_MPH;Integrated Security=SSPI;connect timeout=180;app=Medicity ProAccess;Asynchronous Processing=true", $databaseServer, $clientName, $envtype);
#	} ) 
	
###############################################################	
## RMS 			                                             ##
###############################################################
$rms = @{}
$rms.Add("Community" ,
	@{ 	rmsTcpPort	= "12051";
				communityName = $homeCommunity;
		connectionString = "server=" + $databaseServer + ";Integrated Security=SSPI" + `
				";database=" + $clientName + "_" + $envType + "_" + "CDR_Community" + ";connect timeout=180;app=rms";
		oid = "2.16.840.1.113883.3.579.77.2.7" } )
$rms.Add("CC" ,
	@{ 	rmsTcpPort	= "12052";
		connectionString = "server=" + $databaseServer + ";Integrated Security=SSPI" + `
				";database=" + $clientName + "_" + $envType + "_" + "CDR_CC" + ";connect timeout=180;app=rms";
		oid = "2.16.840.1.113883.3.579.77.2.2" } )
$rms.Add("CTY" ,
	@{ 	rmsTcpPort	= "12053";
		connectionString = "server=" + $databaseServer + ";Integrated Security=SSPI" + `
				";database=" + $clientName + "_" + $envType + "_" + "CDR_CTY" + ";connect timeout=180;app=rms";
		oid = "2.16.840.1.113883.3.579.77.2.1"} )
$rms.Add("LC" ,
	@{ 	rmsTcpPort	= "12054";
		connectionString = "server=" + $databaseServer + ";Integrated Security=SSPI" + `
				";database=" + $clientName + "_" + $envType + "_" + "CDR_LC" + ";connect timeout=180;app=rms";
		oid = "2.16.840.1.113883.3.579.77.2.5"} )
#$rms.Add("GP" ,
#	@{ 	rmsTcpPort	= "21055";
#		connectionString = "server=" + $databaseServer + ";Integrated Security=SSPI" + `
#       ";database=" + $clientName + "_" + $envType + "_" + "CDR_GP" + ";connect timeout=180;app=rms";} )
				
foreach($key in $rms.keys)
{
		$rms[$key].Add("localRmsAppPath", [string]::Format($localrmsAppPath, $key))
		$rms[$key].Add("deployRmsAppPath", [string]::Format($deployrmsAppPath, $key))
		$rms[$key].Add("rmsServiceName", [string]::Format(($rmsServiceName + "_{0}"), $key))
	$rms[$key].Add("rmsTcpURI",		[string]::Format("net.tcp://{0}:{1}/RecordManagement",	$appServer, $rms[$key]["rmsTcpPort"], $key))
}

$jadrOid = "2.16.840.1.113883.3.579.77.2.10"

###############################################################	
## DRS 			                                             ##
###############################################################
$drs = @{}

$drsport = 12901
$aggId = 101
foreach ( $cdrdb in $cdrArray)
{
	$fullDBName = [string]::Format("{0}_{1}_CDR_{2}", $clientName, $envType, $cdrdb)
	$drs.Add($cdrdb ,
		@{ 	drsTcpPort	= ($drsport).ToString();
		connectionString = "server=" + $databaseServer + ";Integrated Security=SSPI" + `
			";database=" + $fullDBName + ";connect timeout=180;app=drs";aggId = ($aggId).ToString();} )
	$drsport += 1
	$aggId += 1
}
				
foreach($key in $drs.keys)
{
		$drs[$key].Add("localDrsAppPath",  [string]::Format($localdrsAppPath + "_{0}", $key))
		$drs[$key].Add("deployDrsAppPath", [string]::Format($deploydrsAppPath + "_{0}", $key))
		$drs[$key].Add("drsServiceName",   [string]::Format(($drsServiceName + "_{0}"), $key))
	$drs[$key].Add("drsTcpURI",		   [string]::Format("net.tcp://{0}:{1}/RecordLocator",	$appServer, $drs[$key]["drsTcpPort"], $key))
	if ( $key -eq "Community" )
	{
		$drs[$key].Add("dfsTcpURI",	   [string]::Format("net.tcp://{0}:{1}", $appServer, $drs[$key]["drsTcpPort"], $key))
		$dfsTcpURI = [string]::Format("net.tcp://{0}:{1}/DataForwarder", $appServer, $drs[$key]["drsTcpPort"], $key)
	}
}

###############################################################
## Nexus service configuration array. Add one of these entries for each Nexus Engine service you plan on firing up. 
## Note the fancy port numbers above, and the magnificent hash table below. You'll need to adjust some of the variable
## names if you need more than one. It's a script, it's not magic...
###############################################################
$nexusEngines = @{}
$nexusEngines.Add("Nexus", @{nexusTcpPort = $nexusEngine1Port; serviceName = ([string]::Concat($clientName, "_", $envType, "_Nexus"));`
				servicePath = $baseAppPath + "\NexusEngine"; `
				connectionString = "server=" + $databaseServer + ";Integrated Security=SSPI;database=" + $nexusDatabaseName + ";application name=NexusEngine" })
###############################################################
## This is for the Instances_Upgrade_All.ps1 script.         ##
## This will update all instances of the types in the array. ##
###############################################################
$upgradeAllInstancesOfTheseTypes = @( "MPIWriter", "HL7Receiver", "HL7Sender", "Validator", "Translator",
"MedicityDatabaseParser", "WorklistWriter", "DeliveryPreferencesRouter", "MessageRouter", "GenericTransformer","DerssTransformer")
				
				
###############################################################
##  Web Settings                                             ##
###############################################################

#NexusManager
$NexusServer = [string]::Format("{0}:{1}", $appServer, $nexusTcpPort)

#MISC Paths(Images, etc)
$leftDefaultHeaderLogo = "/Client/images/proaccess_logo_primary.png"

###############################################################
## Nexus Instance Config variables.                          ##
###############################################################
$nexusCDRConnectionStringGPName = [string]::Format("{0}{1}_CDR_ConnectionString$",'$',$clientName)
$nexusContributingSystems = @{}
	# TRANS Contributing systems (Sending Application, Parent Org RefValue)
	$nexusContributingSystems.Add("RVMCTRANS", "RVMC")
	$nexusContributingSystems.Add("TRCHTRANS", "TRCH")
	
	# LAB Contributing systems (Sending Application, Parent Org RefValue)
	$nexusContributingSystems.Add("RVMCLAB", "RVMC")
	$nexusContributingSystems.Add("TRCHLAB", "TRCH")

###############################################################
## SpreadsheetUtil Config                                    ##
###############################################################
$spreadsheetUtilConfig = '<?xml version="1.0" ?>
<Configuration Version="1.0">
	<Section Name="Configuration">
		<Key Name="OrganizationID" Type="Int32">999</Key> <!-- DEPRECATED: pass this on the command line -->
		<Key Name="ContributorSourceName" Type="String">XYZ</Key> <!-- DEPRECATED: pass this on the command line -->

		<Key Name="CodeSetUploadConnectionString" Type="String">Data Source=slc-med-db5;user ID=MediAdmin;Password=MEDIadm1n;Initial Catalog=CodeSetUpload;Connect Timeout=240;</Key>
		
		<Key Name="CDRConnectionString" Type="String">Data Source=slc-med-db5;user ID=MediAdmin;Password=MEDIadm1n;Initial Catalog=Carolinas_DEV_CDR_IDX;Connect Timeout=2000;</Key>
	</Section>
</Configuration>'

###############################################################
## TaskManager Service Event Destinations.                   ##
## Should be one EventDestinationsNexus.                     ##
## Add for each entry in $nexusEngineArray.                  ##
## Put all event destinations into a hash table              ##
## Key must match key in $nexusEngineArray.                  ##
###############################################################
$taskManagerEventDestinations = @{}
# Destinations for Task Manager service assigned for NexusEngine named 'Nexus' created in $nexusEngineArray
$taskManagerDest1 = @{}
# Add all Destinations for 'Nexus' NexusEngine.  (EventName, Destination)
$taskManagerDest1.Add("AmbulatoryMedsHistoryQuery", "HCSADTEventXmlRouter")
$taskManagerDest1.Add("MDM2CCD", "XDS2CCDEventXmlRouter")
$taskManagerDest1.Add("nvoTesting", "nvoPnrToMdmConverter")
$taskManagerEventDestinations.Add("Nexus",$taskManagerDest1)

###############################################################
## ~~~~~~~~~~~~~~~~~~~~~~~~~~ FIN ~~~~~~~~~~~~~~~~~~~~~~~~~~ ##
###############################################################
