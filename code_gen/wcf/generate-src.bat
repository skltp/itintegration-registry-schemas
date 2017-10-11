
	@REM ---------------------------------------------------------------------------------
	@REM Generates c# WCF service contracts (interface), client proxies and wcf config
	@REM file for the WSDLs + XML Schemas of the service domain, using .Net WCF tool svcuti.exe
	@REM ---------------------------------------------------------------------------------
	@REM Licensed to the Apache Software Foundation (ASF) under one
	@REM or more contributor license agreements. See the NOTICE file
	@REM distributed with this work for additional information
	@REM regarding copyright ownership. Inera AB licenses this file
	@REM to you under the Apache License, Version 2.0 (the
	@REM "License"); you may not use this file except in compliance
	@REM with the License. You may obtain a copy of the License at
	@REM
	@REM http://www.apache.org/licenses/LICENSE-2.0
	@REM Unless required by applicable law or agreed to in writing,
	@REM software distributed under the License is distributed on an
	@REM "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
	@REM KIND, either express or implied. See the License for the
	@REM specific language governing permissions and limitations
	@REM under the License.
	@REM ---------------------------------------------------------------------------------
	CD ..
	
	SET SCHEMADIR=..\schemas
	
	SET W0=%SCHEMADIR%\interactions\GetLogicalAddresseesByServiceContractInteraction\GetLogicalAddresseesByServiceContractInteraction_2.0_RIVTABP21.wsdl
SET X0=%SCHEMADIR%\interactions\GetLogicalAddresseesByServiceContractInteraction\*.xsd

SET W1=%SCHEMADIR%\interactions\GetSupportedServiceContractsInteraction\GetSupportedServiceContractsInteraction_2.0_RIVTABP21.wsdl
SET X1=%SCHEMADIR%\interactions\GetSupportedServiceContractsInteraction\*.xsd

SET XCORE=%SCHEMADIR%\core_components\*.xsd

SET SCHEMAS=%XCORE% %W0% %X0% %W1% %X1% 

SET OUTFILE=/out:wcf\generated-src\ItintegrationRegistryInteractions.cs
SET APPCONFIG=/config:wcf\generated-src\app.config
SET NAMESPACE=/namespace:*,Riv.Itintegration.Registry.Schemas.v1
SET SVCUTIL="svcutil.exe"
%SVCUTIL% /language:cs %OUTFILE% %APPCONFIG% %NAMESPACE% %SCHEMAS%

CD wcf
ECHO Generating Service contract .Net Binding interfaces and classes for itintegration:registry Release 2
ECHO I DotNetprojektet ska du ta lagga till referens till System.ServiceModel
