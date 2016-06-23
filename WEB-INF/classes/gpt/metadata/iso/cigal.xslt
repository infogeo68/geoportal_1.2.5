<?xml version="1.0" encoding="UTF-8"?>
<!-- 
 See the NOTICE file distributed with
 this work for additional information regarding copyright ownership.
 Esri Inc. licenses this file to You under the Apache License, Version 2.0
 (the "License"); you may not use this file except in compliance with
 the License.  You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gml="http://www.opengis.net/gml" 
	xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:srv="http://www.isotc211.org/2005/srv">
	<xsl:output indent="yes" method="html" omit-xml-declaration="yes"/>
	
	
	


	<xsl:template match="/gmd:MD_Metadata">

		
		<h1 class="toolbarTitle"> <xsl:value-of select="/gmd:MD_Metadata/gmd:identificationInfo/gmd:MD_DataIdentification/gmd:citation/gmd:CI_Citation/gmd:title/gco:CharacterString | /gmd:MD_Metadata/gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:citation/gmd:CI_Citation/gmd:title/gco:CharacterString"/>
		</h1>
		

<!-- Découvrir de la donnée -->		

		<span class="section">
			<table class="sectionHeader" onclick="mddOnSectionClicked('general')" summary="This table is for design purposes only.">
				<tbody>
					<tr>
					<td><input id="mdDetails:general-chk" type="checkbox" name="mdDetails:general-chk" checked="checked" style="display:none;" /></td>
					<td><img id="mdDetails:general-img" src="/geoportal/catalog/images/section_open.gif" /></td>
					<td><span class="sectionCaption"><h8>Découvrir de la donnée</h8></span></td>
					</tr>
				</tbody>			
			</table>
			<table id="mdDetails:general-body" class="sectionBody" style="display:block;">
				<tbody>
					<tr>
						<td></td>
						<td>
							<table id="mdDetails:general-params" class="parameters" summary="This table is for design purposes only.">
								<tbody>
								
									<table class="matable" width="770px">
										<tbody>
											<tr><td width="200px"></td><td width="570px"></td></tr>
											<!-- Résumé -->
											<tr>
												<td colspan="2" class="montd2">
													<xsl:if test="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:graphicOverview">
														<xsl:apply-templates select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:graphicOverview/gmd:MD_BrowseGraphic"/>
													</xsl:if>
													<xsl:value-of select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:abstract"/>
												</td>
											</tr>
											<!-- Catégorie ISO -->
											<tr>
												<td class="montd">Catégorie (ISO):</td>
												<td class="montd2">
													<xsl:for-each select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:topicCategory">
														<p/>
														<!-- <xsl:value-of select="gmd:MD_TopicCategoryCode"/> -->
														<xsl:call-template name="get_property">
															<xsl:with-param name="key">catalog.iso19139.MD_TopicCategoryCode.<xsl:value-of select="gmd:MD_TopicCategoryCode"/></xsl:with-param>
														</xsl:call-template>
													</xsl:for-each>
												</td>
											</tr>
											<!-- INSPIRE -->
											<tr>
												<td class="montd">Thèmes Inspire:</td>
												<td class="montd2">
													 <xsl:choose>
														<xsl:when test="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:descriptiveKeywords/gmd:MD_Keywords[contains(gmd:thesaurusName/gmd:CI_Citation/gmd:title/gco:CharacterString, 'GEMET')]">
															<xsl:for-each select='gmd:identificationInfo/gmd:MD_DataIdentification/gmd:descriptiveKeywords/gmd:MD_Keywords'>
																<!--
																<xsl:if test="contains(gmd:thesaurusName/gmd:CI_Citation/gmd:title/gco:CharacterString, 'GEMET')">
																	<p/>
																	<xsl:value-of select="gmd:keyword/gco:CharacterString"/>
																</xsl:if>  
																-->
																<xsl:choose>
																	<xsl:when test="contains(gmd:thesaurusName/gmd:CI_Citation/gmd:title/gco:CharacterString, 'GEMET - INSPIRE')">
																		<p/>
																		<xsl:value-of select="gmd:keyword/gco:CharacterString"/><xsl:text> (Thème INSPIRE)</xsl:text>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:if test="contains(gmd:thesaurusName/gmd:CI_Citation/gmd:title/gco:CharacterString, 'GEMET')">
																		<p/>
																		<xsl:value-of select="gmd:keyword/gco:CharacterString"/><xsl:text> (GEMET)</xsl:text>
																		</xsl:if>
																	</xsl:otherwise>
																</xsl:choose>
															</xsl:for-each>
														</xsl:when>
														<xsl:otherwise>
																-
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
											<!-- Mots clés-->
											<tr>
												<td class="montd">Mots clés:</td>
												<td class="montd2">
													 <xsl:choose>
														<xsl:when test="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:descriptiveKeywords/gmd:MD_Keywords[not(contains(gmd:thesaurusName/gmd:CI_Citation/gmd:title/gco:CharacterString, 'GEMET'))]">
															<xsl:for-each select='gmd:identificationInfo/gmd:MD_DataIdentification/gmd:descriptiveKeywords/gmd:MD_Keywords'>
																<xsl:if test="not(contains(gmd:thesaurusName/gmd:CI_Citation/gmd:title/gco:CharacterString, 'GEMET'))">
																	<p/><xsl:value-of select="gmd:keyword/gco:CharacterString"/>
																</xsl:if>  
															</xsl:for-each>
														</xsl:when>
														<xsl:otherwise>
																-
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
											
										</tbody>
									</table>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</span>
		
<!-- Début Emprise la donnée -->	
		<span class="section">
			<table class="sectionHeader" onclick="mddOnSectionClicked('emprise')" summary="This table is for design purposes only.">
				<tbody>
					<tr>
					<td><input id="mdDetails:emprise-chk" type="checkbox" name="mdDetails:emprise-chk" checked="checked" style="display:none;" /></td>
					<td><img id="mdDetails:emprise-img" src="/geoportal/catalog/images/section_open.gif" /></td>
					<td><span class="sectionCaption"><h8>Emprise de la donnée</h8></span></td>
					</tr>
				</tbody>			
			</table>
			<table id="mdDetails:emprise-body" class="sectionBody" style="display:block;">
				<tbody>
					<tr>
						<td></td>
						<td>
							<table id="mdDetails:emprise-params" class="parameters" summary="This table is for design purposes only.">
								<tbody>
									<script type="text/javascript">
										var mdeEnvelopeIds = new Array('envelope_west','envelope_south','envelope_east','envelope_north');
									</script>
									<table class="matable" width="770px">
										<tbody>
										
											<xsl:if test="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:extent/gmd:EX_Extent/gmd:geographicElement/gmd:EX_GeographicBoundingBox">		
														
												<tr>
													<th class="montd">Nom</th>
													<th class="montd">O</th>
													<th class="montd">E</th>
													<th class="montd">N</th>
													<th class="montd">S</th>
												</tr>
												<!--<xsl:for-each select='gmd:identificationInfo/gmd:MD_DataIdentification/gmd:extent'>-->
												<xsl:if test="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:extent/gmd:EX_Extent">
													<tr>
														<td class="montd2">
															<xsl:value-of select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:extent/gmd:EX_Extent/gmd:description/gco:CharacterString"/>
														</td>
														<td class="montd2">
															<span id="mdDetails:envelope_west"><xsl:value-of select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:extent/gmd:EX_Extent/gmd:geographicElement/gmd:EX_GeographicBoundingBox/gmd:westBoundLongitude/gco:Decimal" />
															</span>
														</td>
														<td class="montd2">
															<span  id="mdDetails:envelope_east"><xsl:value-of select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:extent/gmd:EX_Extent/gmd:geographicElement/gmd:EX_GeographicBoundingBox/gmd:eastBoundLongitude/gco:Decimal" />
															</span>
														</td>
														<td class="montd2">
															<span  id="mdDetails:envelope_north"><xsl:value-of select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:extent/gmd:EX_Extent/gmd:geographicElement/gmd:EX_GeographicBoundingBox/gmd:northBoundLatitude/gco:Decimal" />
															</span>
														</td>
														<td class="montd2">
															<span  id="mdDetails:envelope_south"><xsl:value-of select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:extent/gmd:EX_Extent/gmd:geographicElement/gmd:EX_GeographicBoundingBox/gmd:southBoundLatitude/gco:Decimal" />
															</span>
															
														</td>
													</tr>
													<tr>
														<td class="montd2" colspan="5">
															<div id="interactiveMap" style="width:740px; height:335px; cursor:hand; cursor:pointer; margin: 20px;"></div>
														</td>
													</tr>
												</xsl:if>
												<!-- </xls:for-each> -->
											</xsl:if>
											
										</tbody>
									</table>
							
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</span>			
<!-- Fin Emprise de la donnée -->			
		
		
		
<!-- Début Analyser la donnée -->	
		<span class="section">
			<table class="sectionHeader" onclick="mddOnSectionClicked('analyse')" summary="This table is for design purposes only.">
				<tbody>
					<tr>
					<td><input id="mdDetails:analyse-chk" type="checkbox" name="mdDetails:analyse-chk" checked="checked" style="display:none;" /></td>
					<td><img id="mdDetails:analyse-img" src="/geoportal/catalog/images/section_open.gif" /></td>
					<td><span class="sectionCaption"><h8>Analyser la donnée</h8></span></td>
					</tr>
				</tbody>			
			</table>
			<table id="mdDetails:analyse-body" class="sectionBody" style="display:block;">
				<tbody>
					<tr>
						<td></td>
						<td>
						
							<table id="mdDetails:analyse-params" class="parameters" summary="This table is for design purposes only.">
								<tbody>
								
									<table class="matable" width="770px">
										<tbody>
											<tr>
												<th colspan="2"><h7>Informations spatiales</h7></th>
											</tr>
											<!--Type de représentation -->
											<tr>
												<td class="montd" witdh="200px"> 
													<xsl:call-template name="get_property">
														<xsl:with-param name="key">catalog.iso19139.MD_DataIdentification.spatialRepresentationType</xsl:with-param>
													</xsl:call-template>: 
												</td>
												<td class="montd2" width="570px"> 
													<span id="mdDetails:representationtype">
														<xsl:if test="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:spatialRepresentationType/gmd:MD_SpatialRepresentationTypeCode/@codeListValue">			
															<xsl:call-template name="get_property">
																<xsl:with-param name="key">catalog.iso19139.MD_SpatialRepresentationTypeCode.<xsl:value-of select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:spatialRepresentationType/gmd:MD_SpatialRepresentationTypeCode/@codeListValue" /></xsl:with-param>
															</xsl:call-template>						
														</xsl:if>	
													</span>
												</td>
											</tr>
											<!--Projection -->
											<tr>
												<td class="montd"> 
													Projection:
													<!-- <xsl:call-template name="get_property">
													<xsl:with-param name="key">catalog.iso19139.RS_Identifier.codeSpace</xsl:with-param>
													</xsl:call-template>: -->
												</td>
												<td class="montd2">
													<span id="mdDetails:representationtype">
														<xsl:value-of select="gmd:referenceSystemInfo/gmd:MD_ReferenceSystem/gmd:referenceSystemIdentifier/gmd:RS_Identifier/gmd:code/gco:CharacterString" />
													</span>
												</td>	
											</tr>
											<!-- Echelle -->
											<tr>
												<td class="montd"> 
													Echelle:
													<!-- <xsl:call-template name="get_property">
													<xsl:with-param name="key">xxx</xsl:with-param>
													</xsl:call-template>: -->
												</td>
												<td class="montd2">
													<span id="mdDetails:echelle">
														<xsl:value-of select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:spatialResolution/gmd:MD_Resolution/gmd:equivalentScale/gmd:MD_RepresentativeFraction/gmd:denominator/gco:Integer" />
													</span>
												</td>
											</tr>
											
											<tr><!-- Langue -->
												<th colspan="2"><h7>Langue des données</h7></th>
											</tr>
											<tr>
												<td class="montd"> 
													Langue:
													<!-- <xsl:call-template name="get_property">
													<xsl:with-param name="key">xxx</xsl:with-param>
													</xsl:call-template>: -->
												</td>
												<td class="montd2">
													<span id="mdDetails:langue">
														<xsl:for-each select="gmd:language">			
															<dt>
																<xsl:choose>
																	<xsl:when test=" string-length(gmd:LanguageCode/@codeListValue) > 0">
																			<xsl:call-template name="get_property">
																				<xsl:with-param name="key">catalog.mdCode.language.iso639_2.<xsl:value-of select="gmd:LanguageCode/@codeListValue" /></xsl:with-param>
																			</xsl:call-template>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:value-of select="gco:CharacterString"/>
																	</xsl:otherwise>
																</xsl:choose>				
															</dt>
														</xsl:for-each>	
													</span>
												</td>
											</tr>
											
											<tr> <!-- Actualité de la donnée -->
												<th colspan="2"><h7>Actualité de la donnée</h7></th>
											</tr>
											<!-- Dates -->
											<xsl:for-each select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:citation/gmd:CI_Citation/gmd:date">
												<tr> 
													<td class="montd"> 
														<xsl:call-template name="get_property">
															<xsl:with-param name="key">catalog.iso19139.CI_DateTypeCode.<xsl:value-of select="gmd:CI_Date/gmd:dateType/gmd:CI_DateTypeCode/@codeListValue"/></xsl:with-param>
														</xsl:call-template>:
													</td>
													<td class="montd2">
														<span id="mdDetails:datedonnees">
															<xsl:value-of select="gmd:CI_Date/gmd:date/gco:Date" />
														</span>
													</td>
												</tr>
											</xsl:for-each>
											<!-- Fréquence de mise à jour -->	
											<tr>
												<td class="montd"> 
													Fréquence mise à jour:
													<!-- <xsl:call-template name="get_property">
													<xsl:with-param name="key">xxx</xsl:with-param>
													</xsl:call-template>: -->
												</td>
												<td class="montd2">
													<span id="mdDetails:frequencemaj">
														<xsl:if test="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:resourceMaintenance/gmd:MD_MaintenanceInformation/gmd:maintenanceAndUpdateFrequency">
															<!-- <xsl:value-of select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:resourceMaintenance/gmd:MD_MaintenanceInformation/gmd:maintenanceAndUpdateFrequency/gmd:MD_MaintenanceFrequencyCode/@codeListValue"/>-->
															<xsl:call-template name="get_property">
															<xsl:with-param name="key">catalog.iso19139.MD_MaintenanceFrequencyCode.<xsl:value-of select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:resourceMaintenance/gmd:MD_MaintenanceInformation/gmd:maintenanceAndUpdateFrequency/gmd:MD_MaintenanceFrequencyCode/@codeListValue"/></xsl:with-param>
														</xsl:call-template>
														</xsl:if>

													</span>
												</td>
											</tr>
											
											<tr> <!-- Qualité de la donnée -->
												<th colspan="2"><h7>Qualité de la donnée</h7></th>
											</tr>
											<!--<tr>
												<td class="montd"> 
													Processus:
												</td>
												<td class="montd2"> 
													<span id="mdDetails:processus">
														<xsl:choose>
															<xsl:when test="gmd:dataQualityInfo/gmd:DQ_DataQuality/gmd:lineage/gmd:LI_Lineage/gmd:processStep/gmd:LI_ProcessStep/gmd:description">
																<xsl:value-of select="gmd:dataQualityInfo/gmd:DQ_DataQuality/gmd:lineage/gmd:LI_Lineage/gmd:processStep/gmd:LI_ProcessStep/gmd:description/gco:CharacterString"/>
															</xsl:when>
															<xsl:otherwise>
																Non renseigné
															</xsl:otherwise>
														</xsl:choose>
													</span>
												</td>
											</tr> -->
											<!--<tr>
												<td class="montd"> 
													Origine des données:
												</td>
												<td class="montd2"> 
													<span id="mdDetails:originedonnees">
														<xsl:choose>
															<xsl:when test="gmd:dataQualityInfo/gmd:DQ_DataQuality/gmd:lineage/gmd:LI_Lineage/gmd:source/gmd:LI_Source/gmd:description">
																<xsl:value-of select="gmd:dataQualityInfo/gmd:DQ_DataQuality/gmd:lineage/gmd:LI_Lineage/gmd:source/gmd:LI_Source/gmd:description/gco:CharacterString"/> 
															</xsl:when>
															<xsl:otherwise>
																Non renseigné
															</xsl:otherwise>
														</xsl:choose>
													</span>
												</td>
											</tr> -->
											<tr>
												<td class="montd"> 
													Texte sur la qualité:
													<!-- <xsl:call-template name="get_property">
													<xsl:with-param name="key">xxx</xsl:with-param>
													</xsl:call-template>: -->
												</td>
												<td class="montd2"> 
													<span id="mdDetails:originedonnees">
														<xsl:choose>
															<xsl:when test="gmd:dataQualityInfo/gmd:DQ_DataQuality/gmd:lineage/gmd:LI_Lineage/gmd:statement">
																<xsl:value-of select="gmd:dataQualityInfo/gmd:DQ_DataQuality/gmd:lineage/gmd:LI_Lineage/gmd:statement/gco:CharacterString"/>
															</xsl:when>
															<xsl:otherwise>
																Non renseigné
															</xsl:otherwise>
														</xsl:choose>
													</span>
												</td>
											</tr>
											
											<tr> <!-- Conformité INSPIRE -->
												<th colspan="2">
													<h7>Conformité INSPIRE</h7>
													<table class="matable" width="770px">
														<tbody>
															<tr>
																<th class="montd">Titre du test</th>
																<th class="montd">Date de création</th>
																<th class="montd">Date de révision</th>
																<th class="montd">Date de publication</th>
																<th class="montd">Résultat</th>
																<th class="montd">Conformité</th>
															</tr>
															<xsl:choose>
																<xsl:when test="gmd:dataQualityInfo/gmd:DQ_DataQuality/gmd:report">
																	<xsl:for-each select='gmd:dataQualityInfo/gmd:DQ_DataQuality/gmd:report'>
																		<tr>
																			<td class="montd2"><xsl:value-of select="gmd:DQ_DomainConsistency/gmd:result/gmd:DQ_ConformanceResult/gmd:specification/gmd:CI_Citation/gmd:title/gco:CharacterString/."/></td>
																			<xsl:choose>
																				<xsl:when test="gmd:DQ_DomainConsistency/gmd:result/gmd:DQ_ConformanceResult/gmd:specification/gmd:CI_Citation/gmd:date/gmd:CI_Date/gmd:dateType/gmd:CI_DateTypeCode/@codeListValue = 'creation'">
																					<td class="montd2"><xsl:value-of select="gmd:DQ_DomainConsistency/gmd:result/gmd:DQ_ConformanceResult/gmd:specification/gmd:CI_Citation/gmd:date/gmd:CI_Date/gmd:date/gco:Date"/></td>
																				</xsl:when>
																				<xsl:otherwise>
																					<td class="montd2">Non renseigné</td>
																				</xsl:otherwise>
																			</xsl:choose>
																			<xsl:choose>
																				<xsl:when test="gmd:DQ_DomainConsistency/gmd:result/gmd:DQ_ConformanceResult/gmd:specification/gmd:CI_Citation/gmd:date/gmd:CI_Date/gmd:dateType/gmd:CI_DateTypeCode/@codeListValue = 'publication'">
																					<td class="montd2"><xsl:value-of select="gmd:DQ_DomainConsistency/gmd:result/gmd:DQ_ConformanceResult/gmd:specification/gmd:CI_Citation/gmd:date/gmd:CI_Date/gmd:date/gco:Date"/></td>
																				</xsl:when>
																				<xsl:otherwise>
																					<td class="montd2">Non renseigné</td>
																				</xsl:otherwise>
																			</xsl:choose>
																			<xsl:choose>
																				<xsl:when test="gmd:DQ_DomainConsistency/gmd:result/gmd:DQ_ConformanceResult/gmd:specification/gmd:CI_Citation/gmd:date/gmd:CI_Date/gmd:dateType/gmd:CI_DateTypeCode/@codeListValue = 'revision'">
																					<td class="montd2"><xsl:value-of select="gmd:DQ_DomainConsistency/gmd:result/gmd:DQ_ConformanceResult/gmd:specification/gmd:CI_Citation/gmd:date/gmd:CI_Date/gmd:date/gco:Date"/></td>
																				</xsl:when>
																				<xsl:otherwise>
																					<td class="montd2">Non renseigné</td>
																				</xsl:otherwise>
																			</xsl:choose>
																			<td class="montd2"><xsl:value-of select="gmd:DQ_DomainConsistency/gmd:result/gmd:DQ_ConformanceResult/gmd:explanation/gco:CharacterString/."/></td>
																			<xsl:choose>
																				<xsl:when test="gmd:DQ_DomainConsistency/gmd:result/gmd:DQ_ConformanceResult/gmd:pass/gco:Boolean = 'true'">
																					<td>Conforme</td>
																				</xsl:when>
																				<xsl:when test="gmd:DQ_DomainConsistency/gmd:result/gmd:DQ_ConformanceResult/gmd:pass/gco:Boolean = 'false'">
																					<td class="montd2">Non conforme</td>
																				</xsl:when>
																				<xsl:otherwise>
																					<td class="montd2">Non évalué</td>
																				</xsl:otherwise>
																			</xsl:choose>
																		</tr>
																	</xsl:for-each>
																</xsl:when>
																<xsl:otherwise>
																	<tr>
																		<td class="montd2">Non renseigné</td>
																		<td class="montd2">Non renseigné</td>
																		<td class="montd2">Non renseigné</td>
																		<td class="montd2">Non renseigné</td>
																		<td class="montd2">Non renseigné</td>
																		<td class="montd2">Non renseigné</td>
																	</tr>
																</xsl:otherwise>
															</xsl:choose>
														</tbody>
													</table>
												</th>
											</tr>
											
											
										</tbody>
									</table> 
									
								

	
									
									
									
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</span>			
<!-- Fin Analyser la donnée -->	

<!-- Début Accéder à la donnée -->	
		<span class="section">
			<table class="sectionHeader" onclick="mddOnSectionClicked('acces')" summary="This table is for design purposes only.">
				<tbody>
					<tr>
					<td><input id="mdDetails:acces-chk" type="checkbox" name="mdDetails:acces-chk" checked="checked" style="display:none;" /></td>
					<td><img id="mdDetails:acces-img" src="/geoportal/catalog/images/section_open.gif" /></td>
					<td><span class="sectionCaption"><h8>Accéder à la donnée</h8></span></td>
					</tr>
				</tbody>			
			</table>
			<table id="mdDetails:acces-body" class="sectionBody" style="display:block;">
				<tbody>
					<tr>
						<td>
							<table id="mdDetails:acces-params" class="parameters" summary="This table is for design purposes only.">
								<tbody>
								
									<table class="matable" width="770px">
										<tbody>
											<tr>
												<th colspan="2"><h7>Contraintes et limites</h7></th>
											</tr>
											<!-- useLimitation / Limites d'utilisation -->
											<tr>
												<td class="montd" witdh="200px"> 
													Autres conditions et <p/>
													mentions légales d'utilisation
													
													<!--<xsl:call-template name="get_property">
														<xsl:with-param name="key">catalog.iso19139.MD_Metadata.section.identification.resourceConstraints</xsl:with-param>
													</xsl:call-template>:-->
												</td>
												<td class="montd2" width="570px"> 
													<span id="mdDetails:limitesdutilisation">
														<xsl:choose>
															<xsl:when test="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:resourceConstraints/gmd:MD_Constraints/gmd:useLimitation">
																<xsl:for-each select='gmd:identificationInfo/gmd:MD_DataIdentification/gmd:resourceConstraints/gmd:MD_Constraints/gmd:useLimitation'>
																	<xsl:value-of select="gco:CharacterString/."/>
																</xsl:for-each>
															</xsl:when>
															<xsl:otherwise>
																Non renseigné
															</xsl:otherwise>
														</xsl:choose>
													</span>
												</td>
											</tr>
											
											<!-- accessConstraints / Contraintes d'accès --> 
											 <tr>
												<td class="montd"> 
													Autres contraintes d'accès public
													<!-- <xsl:call-template name="get_property">
														<xsl:with-param name="key">catalog.iso19139.MD_LegalConstraints.accessConstraints</xsl:with-param>
													</xsl:call-template>:-->
												</td>
												<td class="montd2"> 
													<span id="mdDetails:contraintesdacces">
														<xsl:choose>
															<xsl:when test="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:resourceConstraints/gmd:MD_LegalConstraints/gmd:accessConstraints">
																<xsl:for-each select='gmd:identificationInfo/gmd:MD_DataIdentification/gmd:resourceConstraints/gmd:MD_LegalConstraints/gmd:accessConstraints'>
																	<xsl:call-template name="get_property">
																		<xsl:with-param name="key">catalog.iso19139.MD_RestrictionCode.<xsl:value-of select="gmd:MD_RestrictionCode/@codeListValue"/></xsl:with-param>
																	</xsl:call-template>
																</xsl:for-each>
															</xsl:when>
															<xsl:otherwise>
																Non renseigné
															</xsl:otherwise>
														</xsl:choose>
													</span>
												</td>
											</tr>
											
											<!-- otherConstraints / Autres contraintes -->
											<tr>
												<td class="montd" witdh="200px"> 
													Contraintes d'accès <p/>
													public INSPIRE
													<!-- <xsl:call-template name="get_property">
														<xsl:with-param name="key">catalog.iso19139.MD_LegalConstraints.otherConstraints</xsl:with-param>
													</xsl:call-template>: -->
												</td>
												<td class="montd2" width="570px"> 
													<span id="mdDetails:autrescontraintes">
														<xsl:choose>
															<xsl:when test="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:resourceConstraints/gmd:MD_LegalConstraints/gmd:otherConstraints">
																<xsl:for-each select='gmd:identificationInfo/gmd:MD_DataIdentification/gmd:resourceConstraints/gmd:MD_LegalConstraints/gmd:otherConstraints'>
																	<xsl:value-of select="gco:CharacterString/."/><br />
																</xsl:for-each>
															</xsl:when>
															<xsl:otherwise>
																Non renseigné
															</xsl:otherwise>
														</xsl:choose>
													</span>
												</td>
											</tr>
											
											
											
											<!-- useConstraints / Contraintes d'utilisation -->
											<tr>
												<td class="montd" witdh="200px"> 
													Conditions d'utilisation
													<!-- <xsl:call-template name="get_property">
														<xsl:with-param name="key">catalog.iso19139.MD_LegalConstraints.useConstraints</xsl:with-param>
													</xsl:call-template>: -->
												</td>
												<td class="montd2" width="570px"> 
													<span id="mdDetails:contraintesdutilisation">
														<xsl:choose>
															<xsl:when test="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:resourceConstraints/gmd:MD_LegalConstraints/gmd:useConstraints">
																<xsl:for-each select='gmd:identificationInfo/gmd:MD_DataIdentification/gmd:resourceConstraints/gmd:MD_LegalConstraints/gmd:useConstraints'>
																	
																	
																	
																	<xsl:call-template name="get_property">
																		<xsl:with-param name="key">catalog.iso19139.MD_RestrictionCode.<xsl:value-of select="gmd:MD_RestrictionCode/@codeListValue"/></xsl:with-param>
																	</xsl:call-template>
																	
																	<br />
																</xsl:for-each>
															</xsl:when>
															<xsl:otherwise>
																Non renseigné
															</xsl:otherwise>
														</xsl:choose>
													</span>
												</td>
											</tr>
																						
											<!-- Contraintes de sécurité -->
											<tr>
												<td class="montd" witdh="200px"> 
													Niveau de confidentialité
													<!--
													<xsl:call-template name="get_property">
														<xsl:with-param name="key">catalog.iso19139.MD_SecurityConstraints.classification</xsl:with-param>
													</xsl:call-template>:-->
												</td>
												<td class="montd2" width="570px"> 
													<span id="mdDetails:contraintesdesecurite">
														<xsl:choose>
															<xsl:when test="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:resourceConstraints/gmd:MD_SecurityConstraints">												
																	<xsl:call-template name="get_property">
																		<xsl:with-param name="key">catalog.iso19139.MD_ClassificationCode.<xsl:value-of select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:resourceConstraints/gmd:MD_SecurityConstraints/gmd:classification/gmd:MD_ClassificationCode/@codeListValue"/></xsl:with-param>
																	</xsl:call-template>
																	<br />
															</xsl:when>
															<xsl:otherwise>
																Non renseigné
															</xsl:otherwise>
														</xsl:choose>
													</span>
												</td>
											</tr>
										

											
											
											
											
											
											<!-- Format de diffusion -->
											<tr>
												<th colspan="2"><h7>Format de diffusion</h7>
													<table class="matable" width="770px">
														<tbody>
															<tr>
																<th class="montd" width="300px">Nom</th>
																<th class="montd" width="100px">Version</th>
																<th class="montd" width="370px">Description</th>
															</tr>
															<tr>
																<xsl:choose>
																	<xsl:when test="gmd:distributionInfo/gmd:MD_Distribution/gmd:distributionFormat">
																		<xsl:for-each select='gmd:distributionInfo/gmd:MD_Distribution/gmd:distributionFormat'>
																			<tr>
																				<td class="montd2"><xsl:value-of select="gmd:MD_Format/gmd:name/gco:CharacterString"/></td>
																				<td class="montd2"><xsl:value-of select="gmd:MD_Format/gmd:version/gco:CharacterString"/></td>
																				<td class="montd2"><xsl:value-of select="gmd:MD_Format/gmd:specification/gco:CharacterString"/></td>
																			</tr>
																		</xsl:for-each>
																	</xsl:when>
																	<xsl:otherwise>
																		<tr>
																			<td class="montd2">Non renseigné</td>
																			<td class="montd2">Non renseigné</td>
																			<td class="montd2">Non renseigné</td>
																		</tr>
																	</xsl:otherwise>
																</xsl:choose>
															</tr>
															
															
															
														</tbody>
													</table>
												</th>												
											</tr>
											
											<!-- Accès aux  données et aux documents associés -->
											<tr>
												<th colspan="2"><h7>Accès aux  données et aux documents associés</h7>
													<table class="matable" width="770px">
														<tbody>
															<tr>
																<th class="montd" width="150px">Nom</th>
																<th class="montd" width="150px">Description</th>
																<th class="montd" width="470px">Lien / URL</th>
															</tr>
															<tr>
																<xsl:choose>
																	<xsl:when test="gmd:distributionInfo/gmd:MD_Distribution/gmd:transferOptions/gmd:MD_DigitalTransferOptions/gmd:onLine">
																		<xsl:for-each select='gmd:distributionInfo/gmd:MD_Distribution/gmd:transferOptions/gmd:MD_DigitalTransferOptions/gmd:onLine'>
																			<tr>
																				<td class="montd2"><xsl:value-of select="gmd:CI_OnlineResource/gmd:name/gco:CharacterString/."/></td>
																				<td class="montd2"><xsl:value-of select="gmd:CI_OnlineResource/gmd:description/gco:CharacterString/."/></td>
																				<td class="montd2"><a href="{gmd:CI_OnlineResource/gmd:linkage/gmd:URL/.}"><xsl:value-of select="gmd:CI_OnlineResource/gmd:linkage/gmd:URL/."/></a></td>
																			</tr>
																		</xsl:for-each>
																	</xsl:when>
																	<xsl:otherwise>
																		<tr>
																			<td class="montd2">Non renseigné</td>
																			<td class="montd2">Non renseigné</td>
																			<td class="montd2">Non renseigné</td>
																		</tr>
																	</xsl:otherwise>
																</xsl:choose>
															</tr>
														</tbody>
													</table>
												</th>
											</tr>
											
											
										</tbody>
									</table>
							
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</span>			
<!-- Fin Accéder à la donnée -->	
<!-- Début Contacts -->	
		<span class="section">
			<table class="sectionHeader" onclick="mddOnSectionClicked('contacts')" summary="This table is for design purposes only.">
				<tbody>
					<tr>
					<td><input id="mdDetails:contacts-chk" type="checkbox" name="mdDetails:contacts-chk" checked="checked" style="display:none;" /></td>
					<td><img id="mdDetails:contacts-img" src="/geoportal/catalog/images/section_open.gif" /></td>
					<td><span class="sectionCaption"><h8>Contacts</h8></span></td>
					</tr>
				</tbody>			
			</table>
			<table id="mdDetails:contacts-body" class="sectionBody" style="display:block;">
				<tbody>
					<tr>
						<td>
							<table id="mdDetails:contacts-params" class="parameters" summary="This table is for design purposes only.">
								<tbody>
									<table class="matable" width="770px">
										<tbody>
											<tr>
												<th colspan="2"><h7>Contact pour les données</h7></th>
											</tr>
											<!-- Contact pour les données -->
											<tr>
												<th class="montd">Contact</th>
												<th class="montd">Rôle</th>
											</tr>
											<tr>
												<xsl:if test="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:pointOfContact">
													<xsl:for-each select='gmd:identificationInfo/gmd:MD_DataIdentification/gmd:pointOfContact'>
														<xsl:if test="gmd:CI_ResponsibleParty/gmd:role/gmd:CI_RoleCode/@codeListValue='pointOfContact'">
															<xsl:call-template name="responsibleParty">
																<xsl:with-param name="val" select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:pointOfContact"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:for-each>
												</xsl:if>
											</tr>
											
											<tr>
												<th colspan="2"><h7>Contact pour les métadonnées</h7></th>
											</tr>
											<!-- Contact pour les métadonnées -->
											<tr>
												<th class="montd">Contact</th>
												<th class="montd">Rôle</th>
											</tr>
											<tr>
												<xsl:for-each select='gmd:contact'>
													<xsl:call-template name="responsibleParty">
														<xsl:with-param name="val" select="gmd:contact"/>
													</xsl:call-template>
												</xsl:for-each>
											</tr>
											
										</tbody>
									</table>
									
								
									<!--
									<tr>
										<td class="parameterLabel"><b>Données:</b></td>
										<td class="parameterValue">
											<span id="mdDetails:abstract">
											
												<xsl:if test="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:pointOfContact">
													<table border="1" width="100%"  cellspacing="0">
														<tr>
															<th width="80%">Contact</th>
															<th width="20%">Rôle</th>
														</tr>
														<xsl:for-each select='gmd:identificationInfo/gmd:MD_DataIdentification/gmd:pointOfContact'>
															<xsl:if test="gmd:CI_ResponsibleParty/gmd:role/gmd:CI_RoleCode/@codeListValue='pointOfContact'">
																<xsl:call-template name="responsibleParty">
																	<xsl:with-param name="val" select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:pointOfContact"/>
																</xsl:call-template>
															</xsl:if>
														</xsl:for-each>
													</table> 
												</xsl:if>
											</span>
										</td>
									</tr>
									
									<tr>
										<td class="parameterLabel"><b>Métadonnées:</b></td>
										<td class="parameterValue">
											<span id="mdDetails:abstract">
											
												<xsl:if test="gmd:contact">
													<table border="1" width="100%"  cellspacing="0">
														<tr>
															<th width="80%">Contact</th>
															<th width="20%">Rôle</th>
														</tr>
														<xsl:for-each select='gmd:contact'>
															<xsl:call-template name="responsibleParty">
																<xsl:with-param name="val" select="gmd:contact"/>
															</xsl:call-template>
														</xsl:for-each>
													</table> 
												</xsl:if>
					
											</span>
										</td>
									</tr>									
									-->
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</span>			
<!-- Fin Accèder à la donnée -->				
		<!--
		<div class="snipset"><h2>Découverte de la donnnée</h2>
			<b>Catégorie ISO : </b> 
			<xsl:for-each select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:topicCategory">
				<xsl:value-of select="gmd:MD_TopicCategoryCode"/><p/>
			</xsl:for-each>
			<b>Thème INSPIRE : </b> 
			<xsl:for-each select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:descriptiveKeywords">
				<xsl:value-of select="gmd:MD_Keywords/gmd:keyword/gco:CharacterString"/><p/>
			</xsl:for-each>
		</div>
		-->
		
	</xsl:template>
	
	
	<!-- Template pour la création d'un responsible Party -->
    <xsl:template name="responsibleParty">
        <xsl:param name="val"/>
        <tr>
            <td class="montd2"> 
                        
                <xsl:if test="gmd:CI_ResponsibleParty/gmd:individualName/gco:CharacterString != ''">
                    <xsl:value-of select="gmd:CI_ResponsibleParty/gmd:individualName/gco:CharacterString"/> <br />
                </xsl:if>

                <xsl:if test="gmd:CI_ResponsibleParty/gmd:positionName/gco:CharacterString != ''">
                    <xsl:value-of select="gmd:CI_ResponsibleParty/gmd:positionName/gco:CharacterString"/> <br />
                </xsl:if>
                
                <xsl:if test="gmd:CI_ResponsibleParty/gmd:organisationName/gco:CharacterString != ''">
                    <xsl:value-of select="gmd:CI_ResponsibleParty/gmd:organisationName/gco:CharacterString"/> <br />
                </xsl:if>
                
                <xsl:if test="gmd:CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/gmd:CI_Address/gmd:deliveryPoint/gco:CharacterString != ''">
                    <xsl:for-each select='gmd:CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/gmd:CI_Address/gmd:deliveryPoint'>
                        <xsl:value-of select="gco:CharacterString"/> <br />
                    </xsl:for-each>
                </xsl:if>
                
                <xsl:if test="gmd:CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/gmd:CI_Address/gmd:city/gco:CharacterString != ''">
                    <xsl:value-of select="gmd:CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/gmd:CI_Address/gmd:postalCode/gco:CharacterString"/>
                    <xsl:value-of select="gmd:CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/gmd:CI_Address/gmd:city/gco:CharacterString"/>
                    <xsl:value-of select="gmd:CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/gmd:CI_Address/gmd:country/gco:CharacterString"/>
                    <br />
                </xsl:if>
        
                <xsl:if test="gmd:CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:phone/gmd:CI_Telephone/gmd:voice != ''">
                    Tél: 
                    <xsl:for-each select='gmd:CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:phone/gmd:CI_Telephone/gmd:voice'>
                        <xsl:value-of select="gco:CharacterString"/> -
                    </xsl:for-each> <br />
                </xsl:if>
                
                <xsl:if test="gmd:CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:phone/gmd:CI_Telephone/gmd:facsimile != ''">
                    Fax:
                    <xsl:for-each select='gmd:CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:phone/gmd:CI_Telephone/gmd:facsimile'>
                        <xsl:value-of select="gco:CharacterString"/> -
                    </xsl:for-each> <br />
                </xsl:if>
                
                <xsl:if test="gmd:CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/gmd:CI_Address/gmd:electronicMailAddress != ''">
                    E-mail: 
                    <xsl:for-each select='gmd:CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/gmd:CI_Address/gmd:electronicMailAddress'>
                        <xsl:value-of select="gco:CharacterString"/> -
                    </xsl:for-each> <br />
                </xsl:if>
                
                <xsl:if test="gmd:CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:onlineResource/gmd:CI_OnlineResource/gmd:linkage != ''">
                    Site Internet: 
                    <xsl:for-each select='gmd:CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:onlineResource/gmd:CI_OnlineResource/gmd:linkage'>
                        <xsl:value-of select="gmd:URL"/> -
                    </xsl:for-each> <br />
                </xsl:if>
    
            </td>
    
            <td class="montd2">
                <xsl:for-each select='gmd:CI_ResponsibleParty/gmd:role'>
                    <xsl:call-template name="roleCode">
                        <xsl:with-param name="val" select="gmd:CI_RoleCode/@codeListValue"/>
                    </xsl:call-template>                       
                </xsl:for-each> 
            </td>
        </tr>
    </xsl:template>
	
	<!-- Template de traduction des roleCode -->
    <xsl:template name="roleCode">
        <xsl:param name="val"/>
        <xsl:call-template name="get_property">
				<xsl:with-param name="key">catalog.iso19139.CI_RoleCode.<xsl:value-of select="gmd:CI_RoleCode/@codeListValue"/></xsl:with-param>
				</xsl:call-template>
				<br/> 
    </xsl:template>
	
	
	<!-- Graphic overview -->
	
	<xsl:template match="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:graphicOverview/gmd:MD_BrowseGraphic">
		<dl>
			<xsl:if test="gmd:fileName">
			<dt>
				<img>
					<xsl:attribute name="width">190</xsl:attribute>
					<xsl:attribute name="height">190</xsl:attribute>
					<xsl:attribute name="class">monimage</xsl:attribute>
					<xsl:attribute name="src"><xsl:value-of select="normalize-space(gmd:fileName)"/></xsl:attribute>
					<!--<xsl:attribute name="src"><xsl:value-of select="gmd:fileName"/></xsl:attribute>-->
				</img>
			</dt>
			<!--<dt>
				<em>
				<xsl:call-template name="get_property">
				<xsl:with-param name="key">catalog.iso19139.MD_BrowseGraphic</xsl:with-param>
				</xsl:call-template>: </em>							
				<xsl:value-of select="gmd:fileName"/>
			</dt>
			</xsl:if>
			<xsl:if test="gmd:fileType">
				<dt>
					<em>
					<xsl:call-template name="get_property">
					<xsl:with-param name="key">catalog.iso19139.MD_BrowseGraphic.fileType</xsl:with-param>
					</xsl:call-template>: </em>							
					<xsl:value-of select="gmd:fileType"/>
				</dt>
			</xsl:if>
			<xsl:if test="gmd:fileDescription">
				<dt>
					<em>
					<xsl:call-template name="get_property">
					<xsl:with-param name="key">catalog.iso19139.MD_BrowseGraphic.fileDescription</xsl:with-param>
					</xsl:call-template>: </em>								
					<xsl:value-of select="gmd:fileDescription"/>
				</dt>
			-->
			</xsl:if>
		</dl>
	</xsl:template>
	
	<!-- ETENDUE -->
	<xsl:template match="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:extent | srv:extent">
	
		<xsl:template match="gmd:citation/gmd:CI_Citation | gmd:specification/gmd:CI_Citation">
		<dl>
			<xsl:for-each select="gmd:title">
			<dt>
				<em>
				<xsl:call-template name="get_property">
				<xsl:with-param name="key">catalog.iso19139.CI_Citation.<xsl:value-of select="local-name()"/></xsl:with-param>
				</xsl:call-template>: </em>						
				<xsl:value-of select="gco:CharacterString"/>
			</dt>
			</xsl:for-each>
			<xsl:for-each select="gmd:alternativeTitle">
			<dt>
				<em>
				<xsl:call-template name="get_property">
				<xsl:with-param name="key">catalog.iso19139.CI_Citation.<xsl:value-of select="local-name()"/></xsl:with-param>
				</xsl:call-template>: </em>
				<xsl:value-of select="gco:CharacterString"/>
			</dt>
			</xsl:for-each>
			<xsl:for-each select="gmd:date">
			<dt>
				<em>
				<xsl:call-template name="get_property">
				<xsl:with-param name="key">catalog.iso19139.CI_Citation.<xsl:value-of select="local-name()"/></xsl:with-param>
				</xsl:call-template>: </em>
			</dt>
			<dt>
				<xsl:apply-templates select="gmd:CI_Date"/>
			</dt>
			</xsl:for-each>												
			<xsl:for-each select="gmd:edition">
			<dt>
				<em>
				<xsl:call-template name="get_property">
				<xsl:with-param name="key">catalog.iso19139.CI_Citation.<xsl:value-of select="local-name()"/></xsl:with-param>
				</xsl:call-template>: </em>
				<xsl:value-of select="gco:CharacterString"/>
			</dt>
			</xsl:for-each>	
			<xsl:for-each select="gmd:editionDate">
			<dt>
				<em>
				<xsl:call-template name="get_property">
				<xsl:with-param name="key">catalog.iso19139.CI_Citation.<xsl:value-of select="local-name()"/></xsl:with-param>
				</xsl:call-template>: </em>
				<xsl:value-of select="gco:Date"/>
			</dt>
			</xsl:for-each>
			<xsl:for-each select="gmd:identifier">
			<dt>
				<em>
				<xsl:call-template name="get_property">
				<xsl:with-param name="key">catalog.iso19139.CI_Citation.<xsl:value-of select="local-name()"/></xsl:with-param>
				</xsl:call-template>: </em>
				<xsl:apply-templates select="gmd:MD_Identifier/gmd:code/gco:CharacterString"/>
			</dt>
			</xsl:for-each>
			<xsl:if test="gmd:citedResponsibleParty">
			<dt>
					<xsl:apply-templates select="gmd:citedResponsibleParty/gmd:CI_ResponsibleParty"/>
			</dt>
			</xsl:if>				
		</dl>
	</xsl:template>
	
	
	<!-- CI_DATE -->
	<xsl:template match="gmd:CI_Date">
		<dl>
			<dt>
				<em>
				<xsl:call-template name="get_property">
				<xsl:with-param name="key">catalog.iso19139.CI_Date.date</xsl:with-param>
				</xsl:call-template>: </em>
				<xsl:value-of select="gmd:date/gco:Date"/>
			</dt>
			<dt>
				<em>
				<xsl:call-template name="get_property">
				<xsl:with-param name="key">catalog.iso19139.CI_Date.dateType</xsl:with-param>
				</xsl:call-template>: </em>
				
				<xsl:call-template name="get_property">
				<xsl:with-param name="key">catalog.iso19139.CI_DateTypeCode.<xsl:value-of select="gmd:dateType/gmd:CI_DateTypeCode/@codeListValue"/></xsl:with-param>
				</xsl:call-template>
			</dt>
		</dl>
	</xsl:template>
	</xsl:template>


	<!--
		<dl>
			<dt>
				<em>
				<xsl:call-template name="get_property">
				<xsl:with-param name="key">catalog.iso19139.EX_GeographicBoundingBox.westBoundLongitude</xsl:with-param>
				</xsl:call-template>: </em>
				<span id="mdDetails:envelope_west"><xsl:value-of select="gmd:westBoundLongitude/gco:Decimal"/></span>
			</dt>		
			<dt>
				<em>
				<xsl:call-template name="get_property">
				<xsl:with-param name="key">catalog.iso19139.EX_GeographicBoundingBox.eastBoundLongitude</xsl:with-param>
				</xsl:call-template>: </em>							
				<span id="mdDetails:envelope_east"><xsl:value-of select="gmd:eastBoundLongitude/gco:Decimal"/></span>
			</dt>	
			<dt>
				<em>
				<xsl:call-template name="get_property">
				<xsl:with-param name="key">catalog.iso19139.EX_GeographicBoundingBox.northBoundLatitude</xsl:with-param>
				</xsl:call-template>: </em>			
				<span id="mdDetails:envelope_north"><xsl:value-of select="gmd:northBoundLatitude/gco:Decimal"/></span>
			</dt>						
			<dt>
				<em>
				<xsl:call-template name="get_property">
				<xsl:with-param name="key">catalog.iso19139.EX_GeographicBoundingBox.southBoundLatitude</xsl:with-param>
				</xsl:call-template>: </em>							
				<span id="mdDetails:envelope_south"><xsl:value-of select="gmd:southBoundLatitude/gco:Decimal"/></span>
			</dt>	
		</dl>-->


<!-- CONTRAINTES -->	
<xsl:template match="gmd:MD_LegalConstraints | gmd:resourceConstraints/gmd:MD_LegalConstraints">
		<dl>
			<xsl:if test="gmd:accessConstraints">
				<dt>
					<em>
					<xsl:call-template name="get_property">
					<xsl:with-param name="key">catalog.iso19139.MD_LegalConstraints.accessConstraints</xsl:with-param>
					</xsl:call-template>: </em>	
					
					<xsl:call-template name="get_property">
					<xsl:with-param name="key">catalog.iso19139.MD_RestrictionCode.<xsl:value-of select="gmd:accessConstraints/gmd:MD_RestrictionCode/@codeListValue"/></xsl:with-param>
					</xsl:call-template>
				</dt>
			</xsl:if>						
			<xsl:if test="gmd:useConstraints">
				<dt>
					<em>
					<xsl:call-template name="get_property">
					<xsl:with-param name="key">catalog.iso19139.MD_LegalConstraints.useConstraints</xsl:with-param>
					</xsl:call-template>: </em>							
					
					<xsl:call-template name="get_property">
					<xsl:with-param name="key">catalog.iso19139.MD_RestrictionCode.<xsl:value-of select="gmd:useConstraints/gmd:MD_RestrictionCode/@codeListValue"/></xsl:with-param>
					</xsl:call-template>
				</dt>
			</xsl:if>
			<xsl:if test="gmd:otherConstraints">
				<dt>
					<em>
					<xsl:call-template name="get_property">
					<xsl:with-param name="key">catalog.iso19139.MD_LegalConstraints.otherConstraints</xsl:with-param>
					</xsl:call-template>: </em>							
					<xsl:value-of select="gmd:otherConstraints/gco:CharacterString"/>						
				</dt>
			</xsl:if>
		</dl>
	</xsl:template>
	

	
	<!--                -->
	<!--   Properties   -->
	<!--                -->
	<xsl:template name="get_property">
		<xsl:param name="key" />
	<!-- Converted parameters from gpt.properties -->
		<xsl:choose>	
			<xsl:when test=' $key = &quot;catalog.iso19139.gco.CodeListValue.codeList&quot; '>i18n.catalog.iso19139.gco.CodeListValue.codeList</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.gco.CodeListValue.codeListValue&quot; '>i18n.catalog.iso19139.gco.CodeListValue.codeListValue</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.gco.CodeListValue.codeSpace&quot; '>i18n.catalog.iso19139.gco.CodeListValue.codeSpace</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.gco.ObjectIdentification.id&quot; '>i18n.catalog.iso19139.gco.ObjectIdentification.id</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.gco.ObjectIdentification.uuid&quot; '>i18n.catalog.iso19139.gco.ObjectIdentification.uuid</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.gco.ObjectReference.uuidref&quot; '>i18n.catalog.iso19139.gco.ObjectReference.uuidref</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.MD_Identification&quot; '>i18n.catalog.iso19139.MD_Metadata.MD_Identification</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.MD_DataIdentification&quot; '>i18n.catalog.iso19139.MD_Metadata.MD_DataIdentification</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.MD_ServiceIdentification&quot; '>i18n.catalog.iso19139.MD_Metadata.MD_ServiceIdentification</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.MD_BrowseGraphic&quot; '>i18n.catalog.iso19139.MD_Metadata.MD_BrowseGraphic</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.Multiplicity&quot; '>i18n.catalog.iso19139.Multiplicity</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.Multiplicity.range&quot; '>i18n.catalog.iso19139.Multiplicity.range</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MultiplicityRange&quot; '>i18n.catalog.iso19139.MultiplicityRange</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MultiplicityRange.lower&quot; '>i18n.catalog.iso19139.MultiplicityRange.lower</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MultiplicityRange.upper&quot; '>i18n.catalog.iso19139.MultiplicityRange.upper</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.Length&quot; '>i18n.catalog.iso19139.Length</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.Length.km&quot; '>i18n.catalog.iso19139.Length.km</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.Length.m&quot; '>i18n.catalog.iso19139.Length.m</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.Length.mi&quot; '>i18n.catalog.iso19139.Length.mi</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.Length.ft&quot; '>i18n.catalog.iso19139.Length.ft</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.Length.uom&quot; '>i18n.catalog.iso19139.Length.uom</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ApplicationSchemaInformation&quot; '>i18n.catalog.iso19139.MD_ApplicationSchemaInformation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ApplicationSchemaInformation.name&quot; '>i18n.catalog.iso19139.MD_ApplicationSchemaInformation.name</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ApplicationSchemaInformation.schemaLanguage&quot; '>i18n.catalog.iso19139.MD_ApplicationSchemaInformation.schemaLanguage</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ApplicationSchemaInformation.constraintLanguage&quot; '>i18n.catalog.iso19139.MD_ApplicationSchemaInformation.constraintLanguage</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ApplicationSchemaInformation.schemaAscii&quot; '>i18n.catalog.iso19139.MD_ApplicationSchemaInformation.schemaAscii</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ApplicationSchemaInformation.graphicsFile&quot; '>i18n.catalog.iso19139.MD_ApplicationSchemaInformation.graphicsFile</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ApplicationSchemaInformation.softwareDevelopmentFile&quot; '>i18n.catalog.iso19139.MD_ApplicationSchemaInformation.softwareDevelopmentFile</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ApplicationSchemaInformation.softwareDevelopmentFileFormat&quot; '>i18n.catalog.iso19139.MD_ApplicationSchemaInformation.softwareDevelopmentFileFormat</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_ResponsibleParty&quot; '>i18n.catalog.iso19139.CI_ResponsibleParty</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_ResponsibleParty.individualName&quot; '>i18n.catalog.iso19139.CI_ResponsibleParty.individualName</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_ResponsibleParty.organisationName&quot; '>i18n.catalog.iso19139.CI_ResponsibleParty.organisationName</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_ResponsibleParty.positionName&quot; '>i18n.catalog.iso19139.CI_ResponsibleParty.positionName</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_ResponsibleParty.contactInfo&quot; '>i18n.catalog.iso19139.CI_ResponsibleParty.contactInfo</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_ResponsibleParty.role&quot; '>i18n.catalog.iso19139.CI_ResponsibleParty.role</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Contact&quot; '>i18n.catalog.iso19139.CI_Contact</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Contact.phone&quot; '>i18n.catalog.iso19139.CI_Contact.phone</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Contact.address&quot; '>i18n.catalog.iso19139.CI_Contact.address</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Contact.onlineResource&quot; '>i18n.catalog.iso19139.CI_Contact.onlineResource</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Contact.hoursOfService&quot; '>i18n.catalog.iso19139.CI_Contact.hoursOfService</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Contact.contactInstructions&quot; '>i18n.catalog.iso19139.CI_Contact.contactInstructions</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Telephone&quot; '>i18n.catalog.iso19139.CI_Telephone</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Telephone.voice&quot; '>i18n.catalog.iso19139.CI_Telephone.voice</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Telephone.facsimile&quot; '>i18n.catalog.iso19139.CI_Telephone.facsimile</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Address&quot; '>i18n.catalog.iso19139.CI_Address</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Address.deliveryPoint&quot; '>i18n.catalog.iso19139.CI_Address.deliveryPoint</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Address.city&quot; '>i18n.catalog.iso19139.CI_Address.city</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Address.administrativeArea&quot; '>i18n.catalog.iso19139.CI_Address.administrativeArea</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Address.postalCode&quot; '>i18n.catalog.iso19139.CI_Address.postalCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Address.country&quot; '>i18n.catalog.iso19139.CI_Address.country</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Address.electronicMailAddress&quot; '>i18n.catalog.iso19139.CI_Address.electronicMailAddress</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_OnlineResource&quot; '>i18n.catalog.iso19139.CI_OnlineResource</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_OnlineResource.linkage&quot; '>i18n.catalog.iso19139.CI_OnlineResource.linkage</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_OnlineResource.protocol&quot; '>i18n.catalog.iso19139.CI_OnlineResource.protocol</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_OnlineResource.applicationProfile&quot; '>i18n.catalog.iso19139.CI_OnlineResource.applicationProfile</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_OnlineResource.name&quot; '>i18n.catalog.iso19139.CI_OnlineResource.name</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_OnlineResource.description&quot; '>i18n.catalog.iso19139.CI_OnlineResource.description</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_OnlineResource.function&quot; '>i18n.catalog.iso19139.CI_OnlineResource.function</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_OnLineFunctionCode&quot; '>i18n.catalog.iso19139.CI_OnLineFunctionCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_OnLineFunctionCode.caption&quot; '>i18n.catalog.iso19139.CI_OnLineFunctionCode.caption</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_OnLineFunctionCode.download&quot; '>i18n.catalog.iso19139.CI_OnLineFunctionCode.download</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_OnLineFunctionCode.information&quot; '>i18n.catalog.iso19139.CI_OnLineFunctionCode.information</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_OnLineFunctionCode.offlineAccess&quot; '>i18n.catalog.iso19139.CI_OnLineFunctionCode.offlineAccess</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_OnLineFunctionCode.order&quot; '>i18n.catalog.iso19139.CI_OnLineFunctionCode.order</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_OnLineFunctionCode.search&quot; '>i18n.catalog.iso19139.CI_OnLineFunctionCode.search</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_RoleCode&quot; '>i18n.catalog.iso19139.CI_RoleCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_RoleCode.caption&quot; '>i18n.catalog.iso19139.CI_RoleCode.caption</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_RoleCode.resourceProvider&quot; '>i18n.catalog.iso19139.CI_RoleCode.resourceProvider</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_RoleCode.custodian&quot; '>i18n.catalog.iso19139.CI_RoleCode.custodian</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_RoleCode.owner&quot; '>i18n.catalog.iso19139.CI_RoleCode.owner</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_RoleCode.user&quot; '>i18n.catalog.iso19139.CI_RoleCode.user</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_RoleCode.distributor&quot; '>i18n.catalog.iso19139.CI_RoleCode.distributor</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_RoleCode.originator&quot; '>i18n.catalog.iso19139.CI_RoleCode.originator</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_RoleCode.pointOfContact&quot; '>i18n.catalog.iso19139.CI_RoleCode.pointOfContact</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_RoleCode.principalInvestigator&quot; '>i18n.catalog.iso19139.CI_RoleCode.principalInvestigator</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_RoleCode.processor&quot; '>i18n.catalog.iso19139.CI_RoleCode.processor</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_RoleCode.publisher&quot; '>i18n.catalog.iso19139.CI_RoleCode.publisher</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_RoleCode.author&quot; '>i18n.catalog.iso19139.CI_RoleCode.author</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Date&quot; '>i18n.catalog.iso19139.CI_Date</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Date.date&quot; '>i18n.catalog.iso19139.CI_Date.date</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Date.dateType&quot; '>i18n.catalog.iso19139.CI_Date.dateType</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_DateTypeCode&quot; '>i18n.catalog.iso19139.CI_DateTypeCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_DateTypeCode.creation&quot; '>i18n.catalog.iso19139.CI_DateTypeCode.creation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_DateTypeCode.publication&quot; '>i18n.catalog.iso19139.CI_DateTypeCode.publication</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_DateTypeCode.revision&quot; '>i18n.catalog.iso19139.CI_DateTypeCode.revision</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_PresentationFormCode&quot; '>i18n.catalog.iso19139.CI_PresentationFormCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_PresentationFormCode.documentDigital&quot; '>i18n.catalog.iso19139.CI_PresentationFormCode.documentDigital</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_PresentationFormCode.documentHardcopy&quot; '>i18n.catalog.iso19139.CI_PresentationFormCode.documentHardcopy</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_PresentationFormCode.imageDigital&quot; '>i18n.catalog.iso19139.CI_PresentationFormCode.imageDigital</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_PresentationFormCode.imageHardcopy&quot; '>i18n.catalog.iso19139.CI_PresentationFormCode.imageHardcopy</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_PresentationFormCode.mapDigital&quot; '>i18n.catalog.iso19139.CI_PresentationFormCode.mapDigital</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_PresentationFormCode.mapHardcopy&quot; '>i18n.catalog.iso19139.CI_PresentationFormCode.mapHardcopy</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_PresentationFormCode.modelDigital&quot; '>i18n.catalog.iso19139.CI_PresentationFormCode.modelDigital</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_PresentationFormCode.modelHardcopy&quot; '>i18n.catalog.iso19139.CI_PresentationFormCode.modelHardcopy</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_PresentationFormCode.profileDigital&quot; '>i18n.catalog.iso19139.CI_PresentationFormCode.profileDigital</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_PresentationFormCode.profileHardcopy&quot; '>i18n.catalog.iso19139.CI_PresentationFormCode.profileHardcopy</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_PresentationFormCode.tableDigital&quot; '>i18n.catalog.iso19139.CI_PresentationFormCode.tableDigital</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_PresentationFormCode.tableHardcopy&quot; '>i18n.catalog.iso19139.CI_PresentationFormCode.tableHardcopy</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_PresentationFormCode.videoDigital&quot; '>i18n.catalog.iso19139.CI_PresentationFormCode.videoDigital</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_PresentationFormCode.videoHardcopy&quot; '>i18n.catalog.iso19139.CI_PresentationFormCode.videoHardcopy</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Series&quot; '>i18n.catalog.iso19139.CI_Series</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Series.name&quot; '>i18n.catalog.iso19139.CI_Series.name</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Series.issueIdentification&quot; '>i18n.catalog.iso19139.CI_Series.issueIdentification</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Series.page&quot; '>i18n.catalog.iso19139.CI_Series.page</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Citation&quot; '>i18n.catalog.iso19139.CI_Citation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Citation.title&quot; '>i18n.catalog.iso19139.CI_Citation.title</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Citation.alternateTitle&quot; '>i18n.catalog.iso19139.CI_Citation.alternateTitle</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Citation.date&quot; '>i18n.catalog.iso19139.CI_Citation.date</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Citation.edition&quot; '>i18n.catalog.iso19139.CI_Citation.edition</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Citation.editionDate&quot; '>i18n.catalog.iso19139.CI_Citation.editionDate</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Citation.identifier&quot; '>i18n.catalog.iso19139.CI_Citation.identifier</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Citation.citedResponsibleParty&quot; '>i18n.catalog.iso19139.CI_Citation.citedResponsibleParty</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Citation.presentationForm&quot; '>i18n.catalog.iso19139.CI_Citation.presentationForm</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Citation.series&quot; '>i18n.catalog.iso19139.CI_Citation.series</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Citation.otherCitationDetails&quot; '>i18n.catalog.iso19139.CI_Citation.otherCitationDetails</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Citation.ISBN&quot; '>i18n.catalog.iso19139.CI_Citation.ISBN</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Citation.ISSN&quot; '>i18n.catalog.iso19139.CI_Citation.ISSN</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Citation.specification.title&quot; '>i18n.catalog.iso19139.CI_Citation.specification.title</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.CI_Citation.specification.date&quot; '>i18n.catalog.iso19139.CI_Citation.specification.date</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Constraints&quot; '>i18n.catalog.iso19139.MD_Constraints</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Constraints.useLimitation&quot; '>i18n.catalog.iso19139.MD_Constraints.useLimitation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_LegalConstraints&quot; '>i18n.catalog.iso19139.MD_LegalConstraints</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_LegalConstraints.accessConstraints&quot; '>i18n.catalog.iso19139.MD_LegalConstraints.accessConstraints</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_LegalConstraints.useConstraints&quot; '>i18n.catalog.iso19139.MD_LegalConstraints.useConstraints</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_LegalConstraints.otherConstraints&quot; '>i18n.catalog.iso19139.MD_LegalConstraints.otherConstraints</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_SecurityConstraints&quot; '>i18n.catalog.iso19139.MD_SecurityConstraints</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_SecurityConstraints.classification&quot; '>i18n.catalog.iso19139.MD_SecurityConstraints.classification</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_SecurityConstraints.userNote&quot; '>i18n.catalog.iso19139.MD_SecurityConstraints.userNote</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_SecurityConstraints.classificationSystem&quot; '>i18n.catalog.iso19139.MD_SecurityConstraints.classificationSystem</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_SecurityConstraints.handlingDescription&quot; '>i18n.catalog.iso19139.MD_SecurityConstraints.handlingDescription</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ClassificationCode&quot; '>i18n.catalog.iso19139.MD_ClassificationCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ClassificationCode.unclassified&quot; '>i18n.catalog.iso19139.MD_ClassificationCode.unclassified</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ClassificationCode.restricted&quot; '>i18n.catalog.iso19139.MD_ClassificationCode.restricted</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ClassificationCode.confidential&quot; '>i18n.catalog.iso19139.MD_ClassificationCode.confidential</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ClassificationCode.secret&quot; '>i18n.catalog.iso19139.MD_ClassificationCode.secret</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ClassificationCode.topSecret&quot; '>i18n.catalog.iso19139.MD_ClassificationCode.topSecret</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_RestrictionCode&quot; '>i18n.catalog.iso19139.MD_RestrictionCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_RestrictionCode.copyright&quot; '>Droit d'auteur / Droit moral (copyright)</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_RestrictionCode.patent&quot; '>i18n.catalog.iso19139.MD_RestrictionCode.patent</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_RestrictionCode.patentPending&quot; '>i18n.catalog.iso19139.MD_RestrictionCode.patentPending</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_RestrictionCode.trademark&quot; '>i18n.catalog.iso19139.MD_RestrictionCode.trademark</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_RestrictionCode.license&quot; '>i18n.catalog.iso19139.MD_RestrictionCode.license</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_RestrictionCode.intellectualPropertyRights&quot; '>i18n.catalog.iso19139.MD_RestrictionCode.intellectualPropertyRights</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_RestrictionCode.restricted&quot; '>i18n.catalog.iso19139.MD_RestrictionCode.restricted</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_RestrictionCode.otherRestrictions&quot; '>i18n.catalog.iso19139.MD_RestrictionCode.otherRestrictions</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DigitalTransferOptions&quot; '>i18n.catalog.iso19139.MD_DigitalTransferOptions</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DigitalTransferOptions.unitsOfDistribution&quot; '>i18n.catalog.iso19139.MD_DigitalTransferOptions.unitsOfDistribution</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DigitalTransferOptions.transferSize&quot; '>i18n.catalog.iso19139.MD_DigitalTransferOptions.transferSize</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DigitalTransferOptions.onLine&quot; '>i18n.catalog.iso19139.MD_DigitalTransferOptions.onLine</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DigitalTransferOptions.offLine&quot; '>i18n.catalog.iso19139.MD_DigitalTransferOptions.offLine</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Distribution&quot; '>i18n.catalog.iso19139.MD_Distribution</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Distribution.distributionFormat&quot; '>i18n.catalog.iso19139.MD_Distribution.distributionFormat</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Distribution.distributor&quot; '>i18n.catalog.iso19139.MD_Distribution.distributor</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Distribution.transferOptions&quot; '>i18n.catalog.iso19139.MD_Distribution.transferOptions</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Distributor&quot; '>i18n.catalog.iso19139.MD_Distributor</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Distributor.distributorContact&quot; '>i18n.catalog.iso19139.MD_Distributor.distributorContact</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Distributor.distributionOrderProcess&quot; '>i18n.catalog.iso19139.MD_Distributor.distributionOrderProcess</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Distributor.distributorFormat&quot; '>i18n.catalog.iso19139.MD_Distributor.distributorFormat</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Distributor.distributorTransferOptions&quot; '>i18n.catalog.iso19139.MD_Distributor.distributorTransferOptions</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Format&quot; '>i18n.catalog.iso19139.MD_Format</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Format.name&quot; '>i18n.catalog.iso19139.MD_Format.name</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Format.version&quot; '>i18n.catalog.iso19139.MD_Format.version</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Format.amendmentNumber&quot; '>i18n.catalog.iso19139.MD_Format.amendmentNumber</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Format.specification&quot; '>i18n.catalog.iso19139.MD_Format.specification</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Format.fileDecompressionTechnique&quot; '>i18n.catalog.iso19139.MD_Format.fileDecompressionTechnique</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Format.formatDistributor&quot; '>i18n.catalog.iso19139.MD_Format.formatDistributor</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Medium&quot; '>i18n.catalog.iso19139.MD_Medium</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Medium.name&quot; '>i18n.catalog.iso19139.MD_Medium.name</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Medium.density&quot; '>i18n.catalog.iso19139.MD_Medium.density</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Medium.densityUnits&quot; '>i18n.catalog.iso19139.MD_Medium.densityUnits</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Medium.volumes&quot; '>i18n.catalog.iso19139.MD_Medium.volumes</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Medium.mediumFormat&quot; '>i18n.catalog.iso19139.MD_Medium.mediumFormat</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Medium.mediumNote&quot; '>i18n.catalog.iso19139.MD_Medium.mediumNote</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_StandardOrderProcess&quot; '>i18n.catalog.iso19139.MD_StandardOrderProcess</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_StandardOrderProcess.fees&quot; '>i18n.catalog.iso19139.MD_StandardOrderProcess.fees</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_StandardOrderProcess.plannedAvailableDateTime&quot; '>i18n.catalog.iso19139.MD_StandardOrderProcess.plannedAvailableDateTime</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_StandardOrderProcess.orderingInstructions&quot; '>i18n.catalog.iso19139.MD_StandardOrderProcess.orderingInstructions</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_StandardOrderProcess.turnaround&quot; '>i18n.catalog.iso19139.MD_StandardOrderProcess.turnaround</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DistributionUnits&quot; '>i18n.catalog.iso19139.MD_DistributionUnits</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MediumFormatCode&quot; '>i18n.catalog.iso19139.MD_MediumFormatCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MediumFormatCode.cpio&quot; '>i18n.catalog.iso19139.MD_MediumFormatCode.cpio</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MediumFormatCode.tar&quot; '>i18n.catalog.iso19139.MD_MediumFormatCode.tar</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MediumFormatCode.highSierra&quot; '>i18n.catalog.iso19139.MD_MediumFormatCode.highSierra</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MediumFormatCode.iso9660&quot; '>i18n.catalog.iso19139.MD_MediumFormatCode.iso9660</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MediumFormatCode.iso9660RockRidge&quot; '>i18n.catalog.iso19139.MD_MediumFormatCode.iso9660RockRidge</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MediumFormatCode.iso9660AppleHFS&quot; '>i18n.catalog.iso19139.MD_MediumFormatCode.iso9660AppleHFS</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MediumNameCode&quot; '>i18n.catalog.iso19139.MD_MediumNameCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MediumNameCode.cdRom&quot; '>i18n.catalog.iso19139.MD_MediumNameCode.cdRom</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MediumNameCode.dvd&quot; '>i18n.catalog.iso19139.MD_MediumNameCode.dvd</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MediumNameCode.dvdRom&quot; '>i18n.catalog.iso19139.MD_MediumNameCode.dvdRom</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MediumNameCode.3halfInchFloppy&quot; '>i18n.catalog.iso19139.MD_MediumNameCode.3halfInchFloppy</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MediumNameCode.5quarterInchFloppy&quot; '>i18n.catalog.iso19139.MD_MediumNameCode.5quarterInchFloppy</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MediumNameCode.7trackTape&quot; '>i18n.catalog.iso19139.MD_MediumNameCode.7trackTape</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MediumNameCode.9trackType&quot; '>i18n.catalog.iso19139.MD_MediumNameCode.9trackType</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MediumNameCode.3480Cartridge&quot; '>i18n.catalog.iso19139.MD_MediumNameCode.3480Cartridge</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MediumNameCode.3490Cartridge&quot; '>i18n.catalog.iso19139.MD_MediumNameCode.3490Cartridge</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MediumNameCode.3580Cartridge&quot; '>i18n.catalog.iso19139.MD_MediumNameCode.3580Cartridge</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MediumNameCode.4mmCartridgeTape&quot; '>i18n.catalog.iso19139.MD_MediumNameCode.4mmCartridgeTape</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MediumNameCode.8mmCartridgeTape&quot; '>i18n.catalog.iso19139.MD_MediumNameCode.8mmCartridgeTape</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MediumNameCode.1quarterInchCartridgeTape&quot; '>i18n.catalog.iso19139.MD_MediumNameCode.1quarterInchCartridgeTape</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MediumNameCode.digitalLinearTape&quot; '>i18n.catalog.iso19139.MD_MediumNameCode.digitalLinearTape</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MediumNameCode.onLine&quot; '>i18n.catalog.iso19139.MD_MediumNameCode.onLine</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MediumNameCode.satellite&quot; '>i18n.catalog.iso19139.MD_MediumNameCode.satellite</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MediumNameCode.telephoneLink&quot; '>i18n.catalog.iso19139.MD_MediumNameCode.telephoneLink</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MediumNameCode.hardcopy&quot; '>i18n.catalog.iso19139.MD_MediumNameCode.hardcopy</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractEX_GeographicExtent&quot; '>i18n.catalog.iso19139.AbstractEX_GeographicExtent</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractEX_GeographicExtent.extentTypeCode&quot; '>i18n.catalog.iso19139.AbstractEX_GeographicExtent.extentTypeCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.EX_Extent&quot; '>i18n.catalog.iso19139.EX_Extent</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.EX_Extent.description&quot; '>i18n.catalog.iso19139.EX_Extent.description</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.EX_Extent.geographicElement&quot; '>i18n.catalog.iso19139.EX_Extent.geographicElement</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.EX_Extent.temporalElement&quot; '>i18n.catalog.iso19139.EX_Extent.temporalElement</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.EX_Extent.verticalElement&quot; '>i18n.catalog.iso19139.EX_Extent.verticalElement</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.EX_GeographicExtent&quot; '>i18n.catalog.iso19139.EX_GeographicExtent</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.EX_TemporalExtent&quot; '>i18n.catalog.iso19139.EX_TemporalExtent</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.EX_TemporalExtent.extent&quot; '>i18n.catalog.iso19139.EX_TemporalExtent.extent</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.EX_TemporalExtent.beginPosition&quot; '>i18n.catalog.iso19139.EX_TemporalExtent.beginPosition</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.EX_TemporalExtent.endPosition&quot; '>i18n.catalog.iso19139.EX_TemporalExtent.endPosition</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.EX_VerticalExtent&quot; '>i18n.catalog.iso19139.EX_VerticalExtent</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.EX_VerticalExtent.minimumValue&quot; '>i18n.catalog.iso19139.EX_VerticalExtent.minimumValue</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.EX_VerticalExtent.maximumValue&quot; '>i18n.catalog.iso19139.EX_VerticalExtent.maximumValue</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.EX_VerticalExtent.verticalCRS&quot; '>i18n.catalog.iso19139.EX_VerticalExtent.verticalCRS</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.EX_GeographicBoundingBox&quot; '>i18n.catalog.iso19139.EX_GeographicBoundingBox</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.EX_GeographicBoundingBox.westBoundLongitude&quot; '>i18n.catalog.iso19139.EX_GeographicBoundingBox.westBoundLongitude</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.EX_GeographicBoundingBox.eastBoundLongitude&quot; '>i18n.catalog.iso19139.EX_GeographicBoundingBox.eastBoundLongitude</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.EX_GeographicBoundingBox.southBoundLatitude&quot; '>i18n.catalog.iso19139.EX_GeographicBoundingBox.southBoundLatitude</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.EX_GeographicBoundingBox.northBoundLatitude&quot; '>i18n.catalog.iso19139.EX_GeographicBoundingBox.northBoundLatitude</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractMD_Identification&quot; '>i18n.catalog.iso19139.AbstractMD_Identification</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractMD_Identification.citation&quot; '>i18n.catalog.iso19139.AbstractMD_Identification.citation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractMD_Identification.abstract&quot; '>i18n.catalog.iso19139.AbstractMD_Identification.abstract</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractMD_Identification.purpose&quot; '>i18n.catalog.iso19139.AbstractMD_Identification.purpose</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractMD_Identification.credit&quot; '>i18n.catalog.iso19139.AbstractMD_Identification.credit</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractMD_Identification.status&quot; '>i18n.catalog.iso19139.AbstractMD_Identification.status</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractMD_Identification.pointOfContact&quot; '>i18n.catalog.iso19139.AbstractMD_Identification.pointOfContact</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractMD_Identification.resourceMaintenance&quot; '>i18n.catalog.iso19139.AbstractMD_Identification.resourceMaintenance</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractMD_Identification.graphicOverview&quot; '>i18n.catalog.iso19139.AbstractMD_Identification.graphicOverview</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractMD_Identification.resourceFormat&quot; '>i18n.catalog.iso19139.AbstractMD_Identification.resourceFormat</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractMD_Identification.descriptiveKeywords&quot; '>i18n.catalog.iso19139.AbstractMD_Identification.descriptiveKeywords</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractMD_Identification.resourceSpecificUsage&quot; '>i18n.catalog.iso19139.AbstractMD_Identification.resourceSpecificUsage</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractMD_Identification.resourceConstraints&quot; '>i18n.catalog.iso19139.AbstractMD_Identification.resourceConstraints</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractMD_Identification.aggregationInfo&quot; '>i18n.catalog.iso19139.AbstractMD_Identification.aggregationInfo</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DS_Association&quot; '>i18n.catalog.iso19139.DS_Association</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_AggregateInformation&quot; '>i18n.catalog.iso19139.MD_AggregateInformation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_AggregateInformation.aggregateDataSetName&quot; '>i18n.catalog.iso19139.MD_AggregateInformation.aggregateDataSetName</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_AggregateInformation.aggregateDataSetIdentifier&quot; '>i18n.catalog.iso19139.MD_AggregateInformation.aggregateDataSetIdentifier</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_AggregateInformation.associationType&quot; '>i18n.catalog.iso19139.MD_AggregateInformation.associationType</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_AggregateInformation.initiativeType&quot; '>i18n.catalog.iso19139.MD_AggregateInformation.initiativeType</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_BrowseGraphic&quot; '>i18n.catalog.iso19139.MD_BrowseGraphic</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_BrowseGraphic.fileName&quot; '>i18n.catalog.iso19139.MD_BrowseGraphic.fileName</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_BrowseGraphic.fileDescription&quot; '>i18n.catalog.iso19139.MD_BrowseGraphic.fileDescription</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_BrowseGraphic.fileType&quot; '>i18n.catalog.iso19139.MD_BrowseGraphic.fileType</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DataIdentification&quot; '>i18n.catalog.iso19139.MD_DataIdentification</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DataIdentification.spatialRepresentationType&quot; '>i18n.catalog.iso19139.MD_DataIdentification.spatialRepresentationType</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DataIdentification.spatialResolution&quot; '>i18n.catalog.iso19139.MD_DataIdentification.spatialResolution</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DataIdentification.language&quot; '>i18n.catalog.iso19139.MD_DataIdentification.language</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DataIdentification.characterSet&quot; '>i18n.catalog.iso19139.MD_DataIdentification.characterSet</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DataIdentification.topicCategory&quot; '>i18n.catalog.iso19139.MD_DataIdentification.topicCategory</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DataIdentification.environmentDescription&quot; '>i18n.catalog.iso19139.MD_DataIdentification.environmentDescription</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DataIdentification.extent&quot; '>i18n.catalog.iso19139.MD_DataIdentification.extent</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DataIdentification.supplementalInformation&quot; '>i18n.catalog.iso19139.MD_DataIdentification.supplementalInformation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Keywords&quot; '>i18n.catalog.iso19139.MD_Keywords</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Keywords.keyword&quot; '>i18n.catalog.iso19139.MD_Keywords.keyword</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Keywords.type&quot; '>i18n.catalog.iso19139.MD_Keywords.type</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Keywords.thesaurusName&quot; '>i18n.catalog.iso19139.MD_Keywords.thesaurusName</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Keywords.keyword.delimited&quot; '>i18n.catalog.iso19139.MD_Keywords.keyword.delimited</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_RepresentativeFraction&quot; '>i18n.catalog.iso19139.MD_RepresentativeFraction</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_RepresentativeFraction.denominator&quot; '>i18n.catalog.iso19139.MD_RepresentativeFraction.denominator</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Resolution&quot; '>i18n.catalog.iso19139.MD_Resolution</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Resolution.equivalentScale&quot; '>i18n.catalog.iso19139.MD_Resolution.equivalentScale</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Resolution.distance&quot; '>i18n.catalog.iso19139.MD_Resolution.distance</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Usage&quot; '>i18n.catalog.iso19139.MD_Usage</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Usage.specificUsage&quot; '>i18n.catalog.iso19139.MD_Usage.specificUsage</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Usage.usageDateTime&quot; '>i18n.catalog.iso19139.MD_Usage.usageDateTime</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Usage.userDeterminedLimitations&quot; '>i18n.catalog.iso19139.MD_Usage.userDeterminedLimitations</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Usage.userContactInfo&quot; '>i18n.catalog.iso19139.MD_Usage.userContactInfo</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DS_AssociationTypeCode&quot; '>i18n.catalog.iso19139.DS_AssociationTypeCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DS_AssociationTypeCode.crossReference&quot; '>i18n.catalog.iso19139.DS_AssociationTypeCode.crossReference</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DS_AssociationTypeCode.largerWorkCitation&quot; '>i18n.catalog.iso19139.DS_AssociationTypeCode.largerWorkCitation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DS_AssociationTypeCode.partOfSeamlessDatabase&quot; '>i18n.catalog.iso19139.DS_AssociationTypeCode.partOfSeamlessDatabase</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DS_AssociationTypeCode.source&quot; '>i18n.catalog.iso19139.DS_AssociationTypeCode.source</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DS_AssociationTypeCode.stereoMate&quot; '>i18n.catalog.iso19139.DS_AssociationTypeCode.stereoMate</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DS_InitiativeTypeCode&quot; '>i18n.catalog.iso19139.DS_InitiativeTypeCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DS_InitiativeTypeCode.campaign&quot; '>i18n.catalog.iso19139.DS_InitiativeTypeCode.campaign</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DS_InitiativeTypeCode.collection&quot; '>i18n.catalog.iso19139.DS_InitiativeTypeCode.collection</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DS_InitiativeTypeCode.exercise&quot; '>i18n.catalog.iso19139.DS_InitiativeTypeCode.exercise</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DS_InitiativeTypeCode.experiment&quot; '>i18n.catalog.iso19139.DS_InitiativeTypeCode.experiment</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DS_InitiativeTypeCode.investigation&quot; '>i18n.catalog.iso19139.DS_InitiativeTypeCode.investigation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DS_InitiativeTypeCode.mission&quot; '>i18n.catalog.iso19139.DS_InitiativeTypeCode.mission</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DS_InitiativeTypeCode.sensor&quot; '>i18n.catalog.iso19139.DS_InitiativeTypeCode.sensor</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DS_InitiativeTypeCode.operation&quot; '>i18n.catalog.iso19139.DS_InitiativeTypeCode.operation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DS_InitiativeTypeCode.platform&quot; '>i18n.catalog.iso19139.DS_InitiativeTypeCode.platform</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DS_InitiativeTypeCode.process&quot; '>i18n.catalog.iso19139.DS_InitiativeTypeCode.process</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DS_InitiativeTypeCode.program&quot; '>i18n.catalog.iso19139.DS_InitiativeTypeCode.program</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DS_InitiativeTypeCode.project&quot; '>i18n.catalog.iso19139.DS_InitiativeTypeCode.project</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DS_InitiativeTypeCode.study&quot; '>i18n.catalog.iso19139.DS_InitiativeTypeCode.study</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DS_InitiativeTypeCode.task&quot; '>i18n.catalog.iso19139.DS_InitiativeTypeCode.task</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DS_InitiativeTypeCode.trial&quot; '>i18n.catalog.iso19139.DS_InitiativeTypeCode.trial</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CharacterSetCode&quot; '>i18n.catalog.iso19139.MD_CharacterSetCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CharacterSetCode.ucs2&quot; '>i18n.catalog.iso19139.MD_CharacterSetCode.ucs2</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CharacterSetCode.ucs2&quot; '>i18n.catalog.iso19139.MD_CharacterSetCode.ucs2</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CharacterSetCode.ucs4&quot; '>i18n.catalog.iso19139.MD_CharacterSetCode.ucs4</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CharacterSetCode.utf7&quot; '>i18n.catalog.iso19139.MD_CharacterSetCode.utf7</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CharacterSetCode.utf8&quot; '>i18n.catalog.iso19139.MD_CharacterSetCode.utf8</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CharacterSetCode.utf16&quot; '>i18n.catalog.iso19139.MD_CharacterSetCode.utf16</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CharacterSetCode.8859part1&quot; '>i18n.catalog.iso19139.MD_CharacterSetCode.8859part1</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CharacterSetCode.8859part2&quot; '>i18n.catalog.iso19139.MD_CharacterSetCode.8859part2</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CharacterSetCode.8859part3&quot; '>i18n.catalog.iso19139.MD_CharacterSetCode.8859part3</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CharacterSetCode.8859part4&quot; '>i18n.catalog.iso19139.MD_CharacterSetCode.8859part4</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CharacterSetCode.8859part5&quot; '>i18n.catalog.iso19139.MD_CharacterSetCode.8859part5</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CharacterSetCode.8859part6&quot; '>i18n.catalog.iso19139.MD_CharacterSetCode.8859part6</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CharacterSetCode.8859part7&quot; '>i18n.catalog.iso19139.MD_CharacterSetCode.8859part7</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CharacterSetCode.8859part8&quot; '>i18n.catalog.iso19139.MD_CharacterSetCode.8859part8</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CharacterSetCode.8859part9&quot; '>i18n.catalog.iso19139.MD_CharacterSetCode.8859part9</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CharacterSetCode.8859part10&quot; '>i18n.catalog.iso19139.MD_CharacterSetCode.8859part10</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CharacterSetCode.8859part11&quot; '>i18n.catalog.iso19139.MD_CharacterSetCode.8859part11</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CharacterSetCode.8859part13&quot; '>i18n.catalog.iso19139.MD_CharacterSetCode.8859part13</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CharacterSetCode.8859part14&quot; '>i18n.catalog.iso19139.MD_CharacterSetCode.8859part14</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CharacterSetCode.8859part15&quot; '>i18n.catalog.iso19139.MD_CharacterSetCode.8859part15</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CharacterSetCode.8859part16&quot; '>i18n.catalog.iso19139.MD_CharacterSetCode.8859part16</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CharacterSetCode.jis&quot; '>i18n.catalog.iso19139.MD_CharacterSetCode.jis</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CharacterSetCode.shiftJIS&quot; '>i18n.catalog.iso19139.MD_CharacterSetCode.shiftJIS</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CharacterSetCode.eucJP&quot; '>i18n.catalog.iso19139.MD_CharacterSetCode.eucJP</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CharacterSetCode.usAscii&quot; '>i18n.catalog.iso19139.MD_CharacterSetCode.usAscii</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CharacterSetCode.ebcdic&quot; '>i18n.catalog.iso19139.MD_CharacterSetCode.ebcdic</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CharacterSetCode.eucKR&quot; '>i18n.catalog.iso19139.MD_CharacterSetCode.eucKR</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CharacterSetCode.big5&quot; '>i18n.catalog.iso19139.MD_CharacterSetCode.big5</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CharacterSetCode.GB2312&quot; '>i18n.catalog.iso19139.MD_CharacterSetCode.GB2312</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_KeywordTypeCode&quot; '>i18n.catalog.iso19139.MD_KeywordTypeCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_KeywordTypeCode.discipline&quot; '>i18n.catalog.iso19139.MD_KeywordTypeCode.discipline</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_KeywordTypeCode.place&quot; '>i18n.catalog.iso19139.MD_KeywordTypeCode.place</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_KeywordTypeCode.stratum&quot; '>i18n.catalog.iso19139.MD_KeywordTypeCode.stratum</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_KeywordTypeCode.temporal&quot; '>i18n.catalog.iso19139.MD_KeywordTypeCode.temporal</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_KeywordTypeCode.theme&quot; '>i18n.catalog.iso19139.MD_KeywordTypeCode.theme</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ProgressCode&quot; '>i18n.catalog.iso19139.MD_ProgressCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ProgressCode.completed&quot; '>i18n.catalog.iso19139.MD_ProgressCode.completed</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ProgressCode.historicalArchive&quot; '>i18n.catalog.iso19139.MD_ProgressCode.historicalArchive</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ProgressCode.obsolete&quot; '>i18n.catalog.iso19139.MD_ProgressCode.obsolete</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ProgressCode.onGoing&quot; '>i18n.catalog.iso19139.MD_ProgressCode.onGoing</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ProgressCode.planned&quot; '>i18n.catalog.iso19139.MD_ProgressCode.planned</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ProgressCode.required&quot; '>i18n.catalog.iso19139.MD_ProgressCode.required</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ProgressCode.underDevelopment&quot; '>i18n.catalog.iso19139.MD_ProgressCode.underDevelopment</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_SpatialRepresentationTypeCode&quot; '>i18n.catalog.iso19139.MD_SpatialRepresentationTypeCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_SpatialRepresentationTypeCode.vector&quot; '>i18n.catalog.iso19139.MD_SpatialRepresentationTypeCode.vector</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_SpatialRepresentationTypeCode.grid&quot; '>i18n.catalog.iso19139.MD_SpatialRepresentationTypeCode.grid</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_SpatialRepresentationTypeCode.textTable&quot; '>i18n.catalog.iso19139.MD_SpatialRepresentationTypeCode.textTable</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_SpatialRepresentationTypeCode.tin&quot; '>i18n.catalog.iso19139.MD_SpatialRepresentationTypeCode.tin</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_SpatialRepresentationTypeCode.stereoModel&quot; '>i18n.catalog.iso19139.MD_SpatialRepresentationTypeCode.stereoModel</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_SpatialRepresentationTypeCode.video&quot; '>i18n.catalog.iso19139.MD_SpatialRepresentationTypeCode.video</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_TopicCategoryCode&quot; '>i18n.catalog.iso19139.MD_TopicCategoryCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_TopicCategoryCode.boundaries&quot; '>i18n.catalog.iso19139.MD_TopicCategoryCode.boundaries</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_TopicCategoryCode.farming&quot; '>i18n.catalog.iso19139.MD_TopicCategoryCode.farming</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_TopicCategoryCode.climatologyMeteorologyAtmosphere&quot; '>i18n.catalog.iso19139.MD_TopicCategoryCode.climatologyMeteorologyAtmosphere</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_TopicCategoryCode.biota&quot; '>i18n.catalog.iso19139.MD_TopicCategoryCode.biota</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_TopicCategoryCode.economy&quot; '>i18n.catalog.iso19139.MD_TopicCategoryCode.economy</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_TopicCategoryCode.planningCadastre&quot; '>i18n.catalog.iso19139.MD_TopicCategoryCode.planningCadastre</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_TopicCategoryCode.society&quot; '>i18n.catalog.iso19139.MD_TopicCategoryCode.society</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_TopicCategoryCode.elevation&quot; '>i18n.catalog.iso19139.MD_TopicCategoryCode.elevation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_TopicCategoryCode.environment&quot; '>i18n.catalog.iso19139.MD_TopicCategoryCode.environment</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_TopicCategoryCode.structure&quot; '>i18n.catalog.iso19139.MD_TopicCategoryCode.structure</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_TopicCategoryCode.geoscientificInformation&quot; '>i18n.catalog.iso19139.MD_TopicCategoryCode.geoscientificInformation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_TopicCategoryCode.health&quot; '>i18n.catalog.iso19139.MD_TopicCategoryCode.health</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_TopicCategoryCode.imageryBaseMapsEarthCover&quot; '>i18n.catalog.iso19139.MD_TopicCategoryCode.imageryBaseMapsEarthCover</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_TopicCategoryCode.inlandWaters&quot; '>i18n.catalog.iso19139.MD_TopicCategoryCode.inlandWaters</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_TopicCategoryCode.location&quot; '>i18n.catalog.iso19139.MD_TopicCategoryCode.location</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_TopicCategoryCode.intelligenceMilitary&quot; '>i18n.catalog.iso19139.MD_TopicCategoryCode.intelligenceMilitary</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_TopicCategoryCode.oceans&quot; '>i18n.catalog.iso19139.MD_TopicCategoryCode.oceans</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_TopicCategoryCode.transportation&quot; '>i18n.catalog.iso19139.MD_TopicCategoryCode.transportation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_TopicCategoryCode.utilitiesCommunication&quot; '>i18n.catalog.iso19139.MD_TopicCategoryCode.utilitiesCommunication</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.XTN_Identification&quot; '>i18n.catalog.iso19139.XTN_Identification</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.XTN_Identification.citation.title&quot; '>i18n.catalog.iso19139.XTN_Identification.citation.title</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.XTN_Identification.citation.date&quot; '>i18n.catalog.iso19139.XTN_Identification.citation.date</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.XTN_Identification.citation.identifier&quot; '>i18n.catalog.iso19139.XTN_Identification.citation.identifier</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.XTN_Identification.citation.MD_Identifier&quot; '>i18n.catalog.iso19139.XTN_Identification.citation.MD_Identifier</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.XTN_Identification.citation.RS_Identifier&quot; '>i18n.catalog.iso19139.XTN_Identification.citation.RS_Identifier</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.XTN_Identification.abstract&quot; '>i18n.catalog.iso19139.XTN_Identification.abstract</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.XTN_Identification.language&quot; '>i18n.catalog.iso19139.XTN_Identification.language</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.XTN_Identification.topicCategory&quot; '>i18n.catalog.iso19139.XTN_Identification.topicCategory</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.XTN_Identification.spatialRepresentationType&quot; '>i18n.catalog.iso19139.XTN_Identification.spatialRepresentationType</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.XTN_Identification.spatialResolution&quot; '>i18n.catalog.iso19139.XTN_Identification.spatialResolution</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.LocalisedCharacterString&quot; '>i18n.catalog.iso19139.LocalisedCharacterString</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.LocalisedCharacterString.id&quot; '>i18n.catalog.iso19139.LocalisedCharacterString.id</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.LocalisedCharacterString.locale&quot; '>i18n.catalog.iso19139.LocalisedCharacterString.locale</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.LocalisedCharacterString.textNode&quot; '>i18n.catalog.iso19139.LocalisedCharacterString.textNode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.PT_FreeText&quot; '>i18n.catalog.iso19139.PT_FreeText</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.PT_FreeText.textGroup&quot; '>i18n.catalog.iso19139.PT_FreeText.textGroup</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.PT_Locale&quot; '>i18n.catalog.iso19139.PT_Locale</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.PT_Locale.languageCode&quot; '>i18n.catalog.iso19139.PT_Locale.languageCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.PT_Locale.country&quot; '>i18n.catalog.iso19139.PT_Locale.country</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.PT_Locale.characterEncoding&quot; '>i18n.catalog.iso19139.PT_Locale.characterEncoding</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.PT_LocaleContainer&quot; '>i18n.catalog.iso19139.PT_LocaleContainer</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.PT_LocaleContainer.description&quot; '>i18n.catalog.iso19139.PT_LocaleContainer.description</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.PT_LocaleContainer.locale&quot; '>i18n.catalog.iso19139.PT_LocaleContainer.locale</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.PT_LocaleContainer.date&quot; '>i18n.catalog.iso19139.PT_LocaleContainer.date</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.PT_LocaleContainer.responsibleParty&quot; '>i18n.catalog.iso19139.PT_LocaleContainer.responsibleParty</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.PT_LocaleContainer.localisedString&quot; '>i18n.catalog.iso19139.PT_LocaleContainer.localisedString</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MaintenanceInformation&quot; '>i18n.catalog.iso19139.MD_MaintenanceInformation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MaintenanceInformation.maintenanceAndUpdateFrequency&quot; '>i18n.catalog.iso19139.MD_MaintenanceInformation.maintenanceAndUpdateFrequency</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MaintenanceInformation.dateOfNextUpdate&quot; '>i18n.catalog.iso19139.MD_MaintenanceInformation.dateOfNextUpdate</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MaintenanceInformation.userDefinedMaintenanceFrequency&quot; '>i18n.catalog.iso19139.MD_MaintenanceInformation.userDefinedMaintenanceFrequency</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MaintenanceInformation.updateScope&quot; '>i18n.catalog.iso19139.MD_MaintenanceInformation.updateScope</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MaintenanceInformation.updateScopeDescription&quot; '>i18n.catalog.iso19139.MD_MaintenanceInformation.updateScopeDescription</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MaintenanceInformation.maintenanceNote&quot; '>i18n.catalog.iso19139.MD_MaintenanceInformation.maintenanceNote</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MaintenanceInformation.contact&quot; '>i18n.catalog.iso19139.MD_MaintenanceInformation.contact</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ScopeDescription&quot; '>i18n.catalog.iso19139.MD_ScopeDescription</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ScopeDescription.attributes&quot; '>i18n.catalog.iso19139.MD_ScopeDescription.attributes</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ScopeDescription.features&quot; '>i18n.catalog.iso19139.MD_ScopeDescription.features</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ScopeDescription.featureInstances&quot; '>i18n.catalog.iso19139.MD_ScopeDescription.featureInstances</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ScopeDescription.attributeInstances&quot; '>i18n.catalog.iso19139.MD_ScopeDescription.attributeInstances</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ScopeDescription.dataset&quot; '>i18n.catalog.iso19139.MD_ScopeDescription.dataset</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ScopeDescription.other&quot; '>i18n.catalog.iso19139.MD_ScopeDescription.other</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MaintenanceFrequencyCode&quot; '>i18n.catalog.iso19139.MD_MaintenanceFrequencyCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MaintenanceFrequencyCode.continual&quot; '>i18n.catalog.iso19139.MD_MaintenanceFrequencyCode.continual</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MaintenanceFrequencyCode.daily&quot; '>i18n.catalog.iso19139.MD_MaintenanceFrequencyCode.daily</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MaintenanceFrequencyCode.weekly&quot; '>i18n.catalog.iso19139.MD_MaintenanceFrequencyCode.weekly</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MaintenanceFrequencyCode.fortnightly&quot; '>i18n.catalog.iso19139.MD_MaintenanceFrequencyCode.fortnightly</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MaintenanceFrequencyCode.monthly&quot; '>i18n.catalog.iso19139.MD_MaintenanceFrequencyCode.monthly</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MaintenanceFrequencyCode.quarterly&quot; '>i18n.catalog.iso19139.MD_MaintenanceFrequencyCode.quarterly</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MaintenanceFrequencyCode.biannually&quot; '>i18n.catalog.iso19139.MD_MaintenanceFrequencyCode.biannually</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MaintenanceFrequencyCode.annually&quot; '>i18n.catalog.iso19139.MD_MaintenanceFrequencyCode.annually</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MaintenanceFrequencyCode.asNeeded&quot; '>i18n.catalog.iso19139.MD_MaintenanceFrequencyCode.asNeeded</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MaintenanceFrequencyCode.irregular&quot; '>i18n.catalog.iso19139.MD_MaintenanceFrequencyCode.irregular</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MaintenanceFrequencyCode.notPlanned&quot; '>i18n.catalog.iso19139.MD_MaintenanceFrequencyCode.notPlanned</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MaintenanceFrequencyCode.unknown&quot; '>i18n.catalog.iso19139.MD_MaintenanceFrequencyCode.unknown</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ScopeCode&quot; '>i18n.catalog.iso19139.MD_ScopeCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ScopeCode.attribute&quot; '>i18n.catalog.iso19139.MD_ScopeCode.attribute</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ScopeCode.attributeType&quot; '>i18n.catalog.iso19139.MD_ScopeCode.attributeType</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ScopeCode.collectionHardware&quot; '>i18n.catalog.iso19139.MD_ScopeCode.collectionHardware</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ScopeCode.collectionSession&quot; '>i18n.catalog.iso19139.MD_ScopeCode.collectionSession</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ScopeCode.dataset&quot; '>i18n.catalog.iso19139.MD_ScopeCode.dataset</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ScopeCode.series&quot; '>i18n.catalog.iso19139.MD_ScopeCode.series</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ScopeCode.nonGeographicDataset&quot; '>i18n.catalog.iso19139.MD_ScopeCode.nonGeographicDataset</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ScopeCode.dimensionGroup&quot; '>i18n.catalog.iso19139.MD_ScopeCode.dimensionGroup</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ScopeCode.feature&quot; '>i18n.catalog.iso19139.MD_ScopeCode.feature</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ScopeCode.featureType&quot; '>i18n.catalog.iso19139.MD_ScopeCode.featureType</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ScopeCode.propertyType&quot; '>i18n.catalog.iso19139.MD_ScopeCode.propertyType</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ScopeCode.fieldSession&quot; '>i18n.catalog.iso19139.MD_ScopeCode.fieldSession</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ScopeCode.software&quot; '>i18n.catalog.iso19139.MD_ScopeCode.software</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ScopeCode.service&quot; '>i18n.catalog.iso19139.MD_ScopeCode.service</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ScopeCode.model&quot; '>i18n.catalog.iso19139.MD_ScopeCode.model</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ScopeCode.tile&quot; '>i18n.catalog.iso19139.MD_ScopeCode.tile</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractDS_Aggregate&quot; '>i18n.catalog.iso19139.AbstractDS_Aggregate</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractDS_Aggregate.composedOf&quot; '>i18n.catalog.iso19139.AbstractDS_Aggregate.composedOf</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractDS_Aggregate.seriesMetadata&quot; '>i18n.catalog.iso19139.AbstractDS_Aggregate.seriesMetadata</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractDS_Aggregate.subset&quot; '>i18n.catalog.iso19139.AbstractDS_Aggregate.subset</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractDS_Aggregate.superset&quot; '>i18n.catalog.iso19139.AbstractDS_Aggregate.superset</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DS_DataSet&quot; '>i18n.catalog.iso19139.DS_DataSet</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DS_DataSet.has&quot; '>i18n.catalog.iso19139.DS_DataSet.has</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DS_DataSet.partOf&quot; '>i18n.catalog.iso19139.DS_DataSet.partOf</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata&quot; '>i18n.catalog.iso19139.MD_Metadata</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.fileIdentifier&quot; '>i18n.catalog.iso19139.MD_Metadata.fileIdentifier</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.language&quot; '>i18n.catalog.iso19139.MD_Metadata.language</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.characterSet&quot; '>i18n.catalog.iso19139.MD_Metadata.characterSet</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.parentIdentifier&quot; '>i18n.catalog.iso19139.MD_Metadata.parentIdentifier</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.hierarchyLevel&quot; '>i18n.catalog.iso19139.MD_Metadata.hierarchyLevel</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.hierarchyLevelName&quot; '>i18n.catalog.iso19139.MD_Metadata.hierarchyLevelName</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.contact&quot; '>i18n.catalog.iso19139.MD_Metadata.contact</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.contact.help&quot; '>i18n.catalog.iso19139.MD_Metadata.contact.help</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.dateStamp&quot; '>i18n.catalog.iso19139.MD_Metadata.dateStamp</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.metadataStandardName&quot; '>i18n.catalog.iso19139.MD_Metadata.metadataStandardName</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.metadataStandardVersion&quot; '>i18n.catalog.iso19139.MD_Metadata.metadataStandardVersion</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.dataSetURI&quot; '>i18n.catalog.iso19139.MD_Metadata.dataSetURI</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.locale&quot; '>i18n.catalog.iso19139.MD_Metadata.locale</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.spatialRepresentationInfo&quot; '>i18n.catalog.iso19139.MD_Metadata.spatialRepresentationInfo</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.referenceSystemInfo&quot; '>i18n.catalog.iso19139.MD_Metadata.referenceSystemInfo</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.metadataExtensionInfo&quot; '>i18n.catalog.iso19139.MD_Metadata.metadataExtensionInfo</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.identificationInfo&quot; '>i18n.catalog.iso19139.MD_Metadata.identificationInfo</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.contentInfo&quot; '>i18n.catalog.iso19139.MD_Metadata.contentInfo</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.distributionInfo&quot; '>i18n.catalog.iso19139.MD_Metadata.distributionInfo</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.dataQualityInfo&quot; '>i18n.catalog.iso19139.MD_Metadata.dataQualityInfo</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.portrayalCatalogueInfo&quot; '>i18n.catalog.iso19139.MD_Metadata.portrayalCatalogueInfo</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.metadataConstraints&quot; '>i18n.catalog.iso19139.MD_Metadata.metadataConstraints</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.applicationSchemaInfo&quot; '>i18n.catalog.iso19139.MD_Metadata.applicationSchemaInfo</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.metadataMaintenance&quot; '>i18n.catalog.iso19139.MD_Metadata.metadataMaintenance</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.series&quot; '>i18n.catalog.iso19139.MD_Metadata.series</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.describes&quot; '>i18n.catalog.iso19139.MD_Metadata.describes</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.propertyType&quot; '>i18n.catalog.iso19139.MD_Metadata.propertyType</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.featureType&quot; '>i18n.catalog.iso19139.MD_Metadata.featureType</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.featureAttribute&quot; '>i18n.catalog.iso19139.MD_Metadata.featureAttribute</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.section.metadata&quot; '>i18n.catalog.iso19139.MD_Metadata.section.metadata</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.section.metadata.identifier&quot; '>i18n.catalog.iso19139.MD_Metadata.section.metadata.identifier</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.section.metadata.contact&quot; '>i18n.catalog.iso19139.MD_Metadata.section.metadata.contact</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.section.metadata.date&quot; '>i18n.catalog.iso19139.MD_Metadata.section.metadata.date</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.section.metadata.standard&quot; '>i18n.catalog.iso19139.MD_Metadata.section.metadata.standard</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.section.metadata.reference&quot; '>i18n.catalog.iso19139.MD_Metadata.section.metadata.reference</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.section.identification&quot; '>i18n.catalog.iso19139.MD_Metadata.section.identification</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.section.identification.citation&quot; '>i18n.catalog.iso19139.MD_Metadata.section.identification.citation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.section.identification.abstract&quot; '>i18n.catalog.iso19139.MD_Metadata.section.identification.abstract</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.section.identification.contact&quot; '>i18n.catalog.iso19139.MD_Metadata.section.identification.contact</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.section.identification.graphicOverview&quot; '>i18n.catalog.iso19139.MD_Metadata.section.identification.graphicOverview</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.section.identification.descriptiveKeywords&quot; '>i18n.catalog.iso19139.MD_Metadata.section.identification.descriptiveKeywords</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.section.identification.otherKeywords&quot; '>i18n.catalog.iso19139.MD_Metadata.section.identification.otherKeywords</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.section.identification.resourceConstraints&quot; '>i18n.catalog.iso19139.MD_Metadata.section.identification.resourceConstraints</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.section.identification.resource&quot; '>i18n.catalog.iso19139.MD_Metadata.section.identification.resource</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.section.identification.representation&quot; '>i18n.catalog.iso19139.MD_Metadata.section.identification.representation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.section.identification.language&quot; '>i18n.catalog.iso19139.MD_Metadata.section.identification.language</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.section.identification.classification&quot; '>i18n.catalog.iso19139.MD_Metadata.section.identification.classification</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.section.identification.extent&quot; '>i18n.catalog.iso19139.MD_Metadata.section.identification.extent</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.section.identification.extent.geographicElement&quot; '>i18n.catalog.iso19139.MD_Metadata.section.identification.extent.geographicElement</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.section.identification.extent.temporalElement&quot; '>i18n.catalog.iso19139.MD_Metadata.section.identification.extent.temporalElement</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.section.identification.service.serviceType&quot; '>i18n.catalog.iso19139.MD_Metadata.section.identification.service.serviceType</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.section.identification.service.couplingType&quot; '>i18n.catalog.iso19139.MD_Metadata.section.identification.service.couplingType</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.section.identification.service.operation&quot; '>i18n.catalog.iso19139.MD_Metadata.section.identification.service.operation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.section.identification.service.operatesOn&quot; '>i18n.catalog.iso19139.MD_Metadata.section.identification.service.operatesOn</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.section.distribution&quot; '>i18n.catalog.iso19139.MD_Metadata.section.distribution</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.section.quality&quot; '>i18n.catalog.iso19139.MD_Metadata.section.quality</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.section.quality.scope&quot; '>i18n.catalog.iso19139.MD_Metadata.section.quality.scope</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.section.quality.conformance&quot; '>i18n.catalog.iso19139.MD_Metadata.section.quality.conformance</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Metadata.section.quality.lineage&quot; '>i18n.catalog.iso19139.MD_Metadata.section.quality.lineage</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ExtendedElementInformation&quot; '>i18n.catalog.iso19139.MD_ExtendedElementInformation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ExtendedElementInformation.name&quot; '>i18n.catalog.iso19139.MD_ExtendedElementInformation.name</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ExtendedElementInformation.shortName&quot; '>i18n.catalog.iso19139.MD_ExtendedElementInformation.shortName</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ExtendedElementInformation.domainCode&quot; '>i18n.catalog.iso19139.MD_ExtendedElementInformation.domainCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ExtendedElementInformation.definition&quot; '>i18n.catalog.iso19139.MD_ExtendedElementInformation.definition</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ExtendedElementInformation.obligation&quot; '>i18n.catalog.iso19139.MD_ExtendedElementInformation.obligation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ExtendedElementInformation.condition&quot; '>i18n.catalog.iso19139.MD_ExtendedElementInformation.condition</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ExtendedElementInformation.dataType&quot; '>i18n.catalog.iso19139.MD_ExtendedElementInformation.dataType</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ExtendedElementInformation.maximumOccurrence&quot; '>i18n.catalog.iso19139.MD_ExtendedElementInformation.maximumOccurrence</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ExtendedElementInformation.domainValue&quot; '>i18n.catalog.iso19139.MD_ExtendedElementInformation.domainValue</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ExtendedElementInformation.parentEntity&quot; '>i18n.catalog.iso19139.MD_ExtendedElementInformation.parentEntity</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ExtendedElementInformation.rule&quot; '>i18n.catalog.iso19139.MD_ExtendedElementInformation.rule</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ExtendedElementInformation.rationale&quot; '>i18n.catalog.iso19139.MD_ExtendedElementInformation.rationale</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ExtendedElementInformation.source&quot; '>i18n.catalog.iso19139.MD_ExtendedElementInformation.source</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MetadataExtensionInformation&quot; '>i18n.catalog.iso19139.MD_MetadataExtensionInformation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MetadataExtensionInformation.extensionOnLineResource&quot; '>i18n.catalog.iso19139.MD_MetadataExtensionInformation.extensionOnLineResource</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_MetadataExtensionInformation.extendedElementInformation&quot; '>i18n.catalog.iso19139.MD_MetadataExtensionInformation.extendedElementInformation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DatatypeCode&quot; '>i18n.catalog.iso19139.MD_DatatypeCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DatatypeCode.class&quot; '>i18n.catalog.iso19139.MD_DatatypeCode.class</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DatatypeCode.codelist&quot; '>i18n.catalog.iso19139.MD_DatatypeCode.codelist</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DatatypeCode.enumeration&quot; '>i18n.catalog.iso19139.MD_DatatypeCode.enumeration</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DatatypeCode.codelistElement&quot; '>i18n.catalog.iso19139.MD_DatatypeCode.codelistElement</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DatatypeCode.abstractClass&quot; '>i18n.catalog.iso19139.MD_DatatypeCode.abstractClass</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DatatypeCode.aggregateClass&quot; '>i18n.catalog.iso19139.MD_DatatypeCode.aggregateClass</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DatatypeCode.specifiedClass&quot; '>i18n.catalog.iso19139.MD_DatatypeCode.specifiedClass</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DatatypeCode.datatypeClass&quot; '>i18n.catalog.iso19139.MD_DatatypeCode.datatypeClass</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DatatypeCode.interfaceClass&quot; '>i18n.catalog.iso19139.MD_DatatypeCode.interfaceClass</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DatatypeCode.unionClass&quot; '>i18n.catalog.iso19139.MD_DatatypeCode.unionClass</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DatatypeCode.metaClass&quot; '>i18n.catalog.iso19139.MD_DatatypeCode.metaClass</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DatatypeCode.typeClass&quot; '>i18n.catalog.iso19139.MD_DatatypeCode.typeClass</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DatatypeCode.characterString&quot; '>i18n.catalog.iso19139.MD_DatatypeCode.characterString</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DatatypeCode.integer&quot; '>i18n.catalog.iso19139.MD_DatatypeCode.integer</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DatatypeCode.association&quot; '>i18n.catalog.iso19139.MD_DatatypeCode.association</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ObligationCode&quot; '>i18n.catalog.iso19139.MD_ObligationCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ObligationCode.mandatory&quot; '>i18n.catalog.iso19139.MD_ObligationCode.mandatory</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ObligationCode.optional&quot; '>i18n.catalog.iso19139.MD_ObligationCode.optional</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ObligationCode.conditional&quot; '>i18n.catalog.iso19139.MD_ObligationCode.conditional</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_PortrayalCatalogueReference&quot; '>i18n.catalog.iso19139.MD_PortrayalCatalogueReference</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_PortrayalCatalogueReference.portrayalCatalogueCitation&quot; '>i18n.catalog.iso19139.MD_PortrayalCatalogueReference.portrayalCatalogueCitation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractRS_ReferenceSystem&quot; '>i18n.catalog.iso19139.AbstractRS_ReferenceSystem</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractRS_ReferenceSystem.name&quot; '>i18n.catalog.iso19139.AbstractRS_ReferenceSystem.name</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractRS_ReferenceSystem.domainOfValidity&quot; '>i18n.catalog.iso19139.AbstractRS_ReferenceSystem.domainOfValidity</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Identifier&quot; '>i18n.catalog.iso19139.MD_Identifier</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Identifier.authority&quot; '>i18n.catalog.iso19139.MD_Identifier.authority</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Identifier.code&quot; '>i18n.catalog.iso19139.MD_Identifier.code</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ReferenceSystem&quot; '>i18n.catalog.iso19139.MD_ReferenceSystem</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ReferenceSystem.referenceSystemIdentifier&quot; '>i18n.catalog.iso19139.MD_ReferenceSystem.referenceSystemIdentifier</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.RS_Identifier&quot; '>i18n.catalog.iso19139.RS_Identifier</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.RS_Identifier.authority&quot; '>i18n.catalog.iso19139.RS_Identifier.authority</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.RS_Identifier.code&quot; '>i18n.catalog.iso19139.RS_Identifier.code</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.RS_Identifier.codeSpace&quot; '>i18n.catalog.iso19139.RS_Identifier.codeSpace</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.RS_Identifier.version&quot; '>i18n.catalog.iso19139.RS_Identifier.version</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Dimension&quot; '>i18n.catalog.iso19139.MD_Dimension</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Dimension.dimensionName&quot; '>i18n.catalog.iso19139.MD_Dimension.dimensionName</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Dimension.dimensionSize&quot; '>i18n.catalog.iso19139.MD_Dimension.dimensionSize</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Dimension.resolution&quot; '>i18n.catalog.iso19139.MD_Dimension.resolution</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_GeometricObjects&quot; '>i18n.catalog.iso19139.MD_GeometricObjects</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_GeometricObjects.geometricObjectType&quot; '>i18n.catalog.iso19139.MD_GeometricObjects.geometricObjectType</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_GeometricObjects.geometricObjectCount&quot; '>i18n.catalog.iso19139.MD_GeometricObjects.geometricObjectCount</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Georectified&quot; '>i18n.catalog.iso19139.MD_Georectified</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Georectified.checkPointAvailability&quot; '>i18n.catalog.iso19139.MD_Georectified.checkPointAvailability</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Georectified.checkPointDescription&quot; '>i18n.catalog.iso19139.MD_Georectified.checkPointDescription</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Georectified.cornerPoints&quot; '>i18n.catalog.iso19139.MD_Georectified.cornerPoints</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Georectified.centerPoint&quot; '>i18n.catalog.iso19139.MD_Georectified.centerPoint</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Georectified.pointInPixel&quot; '>i18n.catalog.iso19139.MD_Georectified.pointInPixel</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Georectified.transformationDimensionDescription&quot; '>i18n.catalog.iso19139.MD_Georectified.transformationDimensionDescription</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Georectified.transformationDimensionMapping&quot; '>i18n.catalog.iso19139.MD_Georectified.transformationDimensionMapping</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Georeferenceable&quot; '>i18n.catalog.iso19139.MD_Georeferenceable</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Georeferenceable.controlPointAvailability&quot; '>i18n.catalog.iso19139.MD_Georeferenceable.controlPointAvailability</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Georeferenceable.orientationParameterAvailability&quot; '>i18n.catalog.iso19139.MD_Georeferenceable.orientationParameterAvailability</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Georeferenceable.orientationParameterDescription&quot; '>i18n.catalog.iso19139.MD_Georeferenceable.orientationParameterDescription</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Georeferenceable.georeferencedParameters&quot; '>i18n.catalog.iso19139.MD_Georeferenceable.georeferencedParameters</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Georeferenceable.parameterCitation&quot; '>i18n.catalog.iso19139.MD_Georeferenceable.parameterCitation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_GridSpatialRepresentation&quot; '>i18n.catalog.iso19139.MD_GridSpatialRepresentation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_GridSpatialRepresentation.numberOfDimensions&quot; '>i18n.catalog.iso19139.MD_GridSpatialRepresentation.numberOfDimensions</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_GridSpatialRepresentation.axisDimensionProperties&quot; '>i18n.catalog.iso19139.MD_GridSpatialRepresentation.axisDimensionProperties</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_GridSpatialRepresentation.cellGeometry&quot; '>i18n.catalog.iso19139.MD_GridSpatialRepresentation.cellGeometry</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_GridSpatialRepresentation.transformationParameterAvailability&quot; '>i18n.catalog.iso19139.MD_GridSpatialRepresentation.transformationParameterAvailability</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_VectorSpatialRepresentation&quot; '>i18n.catalog.iso19139.MD_VectorSpatialRepresentation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_VectorSpatialRepresentation.topologyLevel&quot; '>i18n.catalog.iso19139.MD_VectorSpatialRepresentation.topologyLevel</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_VectorSpatialRepresentation.geometricObjects&quot; '>i18n.catalog.iso19139.MD_VectorSpatialRepresentation.geometricObjects</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CellGeometryCode&quot; '>i18n.catalog.iso19139.MD_CellGeometryCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CellGeometryCode.point&quot; '>i18n.catalog.iso19139.MD_CellGeometryCode.point</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CellGeometryCode.area&quot; '>i18n.catalog.iso19139.MD_CellGeometryCode.area</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DimensionNameTypeCode&quot; '>i18n.catalog.iso19139.MD_DimensionNameTypeCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DimensionNameTypeCode.row&quot; '>i18n.catalog.iso19139.MD_DimensionNameTypeCode.row</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DimensionNameTypeCode.column&quot; '>i18n.catalog.iso19139.MD_DimensionNameTypeCode.column</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DimensionNameTypeCode.vertical&quot; '>i18n.catalog.iso19139.MD_DimensionNameTypeCode.vertical</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DimensionNameTypeCode.track&quot; '>i18n.catalog.iso19139.MD_DimensionNameTypeCode.track</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DimensionNameTypeCode.crossTrack&quot; '>i18n.catalog.iso19139.MD_DimensionNameTypeCode.crossTrack</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DimensionNameTypeCode.line&quot; '>i18n.catalog.iso19139.MD_DimensionNameTypeCode.line</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DimensionNameTypeCode.sample&quot; '>i18n.catalog.iso19139.MD_DimensionNameTypeCode.sample</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_DimensionNameTypeCode.time&quot; '>i18n.catalog.iso19139.MD_DimensionNameTypeCode.time</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_GeometricObjectTypeCode&quot; '>i18n.catalog.iso19139.MD_GeometricObjectTypeCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_GeometricObjectTypeCode.complex&quot; '>i18n.catalog.iso19139.MD_GeometricObjectTypeCode.complex</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_GeometricObjectTypeCode.composite&quot; '>i18n.catalog.iso19139.MD_GeometricObjectTypeCode.composite</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_GeometricObjectTypeCode.curve&quot; '>i18n.catalog.iso19139.MD_GeometricObjectTypeCode.curve</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_GeometricObjectTypeCode.point&quot; '>i18n.catalog.iso19139.MD_GeometricObjectTypeCode.point</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_GeometricObjectTypeCode.solid&quot; '>i18n.catalog.iso19139.MD_GeometricObjectTypeCode.solid</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_GeometricObjectTypeCode.surface&quot; '>i18n.catalog.iso19139.MD_GeometricObjectTypeCode.surface</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_PixelOrientationCode&quot; '>i18n.catalog.iso19139.MD_PixelOrientationCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_PixelOrientationCode.center&quot; '>i18n.catalog.iso19139.MD_PixelOrientationCode.center</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_PixelOrientationCode.lowerLeft&quot; '>i18n.catalog.iso19139.MD_PixelOrientationCode.lowerLeft</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_PixelOrientationCode.lowerRight&quot; '>i18n.catalog.iso19139.MD_PixelOrientationCode.lowerRight</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_PixelOrientationCode.upperRight&quot; '>i18n.catalog.iso19139.MD_PixelOrientationCode.upperRight</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_PixelOrientationCode.upperLeft&quot; '>i18n.catalog.iso19139.MD_PixelOrientationCode.upperLeft</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_TopologyLevelCode&quot; '>i18n.catalog.iso19139.MD_TopologyLevelCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_TopologyLevelCode.geometryOnly&quot; '>i18n.catalog.iso19139.MD_TopologyLevelCode.geometryOnly</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_TopologyLevelCode.topology1D&quot; '>i18n.catalog.iso19139.MD_TopologyLevelCode.topology1D</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_TopologyLevelCode.planarGraph&quot; '>i18n.catalog.iso19139.MD_TopologyLevelCode.planarGraph</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_TopologyLevelCode.fullPlanarGraph&quot; '>i18n.catalog.iso19139.MD_TopologyLevelCode.fullPlanarGraph</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_TopologyLevelCode.surfaceGraph&quot; '>i18n.catalog.iso19139.MD_TopologyLevelCode.surfaceGraph</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_TopologyLevelCode.fullSurfaceGraph&quot; '>i18n.catalog.iso19139.MD_TopologyLevelCode.fullSurfaceGraph</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_TopologyLevelCode.topology3D&quot; '>i18n.catalog.iso19139.MD_TopologyLevelCode.topology3D</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_TopologyLevelCode.fullTopology3D&quot; '>i18n.catalog.iso19139.MD_TopologyLevelCode.fullTopology3D</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_TopologyLevelCode.abstract&quot; '>i18n.catalog.iso19139.MD_TopologyLevelCode.abstract</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_DataQuality&quot; '>i18n.catalog.iso19139.DQ_DataQuality</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_DataQuality.scope&quot; '>i18n.catalog.iso19139.DQ_DataQuality.scope</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_DataQuality.report&quot; '>i18n.catalog.iso19139.DQ_DataQuality.report</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_DataQuality.lineage&quot; '>i18n.catalog.iso19139.DQ_DataQuality.lineage</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_Scope&quot; '>i18n.catalog.iso19139.DQ_Scope</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_Scope.level&quot; '>i18n.catalog.iso19139.DQ_Scope.level</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_Scope.extent&quot; '>i18n.catalog.iso19139.DQ_Scope.extent</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_Scope.levelDescription&quot; '>i18n.catalog.iso19139.DQ_Scope.levelDescription</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractDQ_Element&quot; '>i18n.catalog.iso19139.AbstractDQ_Element</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractDQ_Element.nameOfMeasure&quot; '>i18n.catalog.iso19139.AbstractDQ_Element.nameOfMeasure</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractDQ_Element.measureIdentification&quot; '>i18n.catalog.iso19139.AbstractDQ_Element.measureIdentification</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractDQ_Element.measureDescription&quot; '>i18n.catalog.iso19139.AbstractDQ_Element.measureDescription</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractDQ_Element.evaluationMethodType&quot; '>i18n.catalog.iso19139.AbstractDQ_Element.evaluationMethodType</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractDQ_Element.evaluationMethodDescription&quot; '>i18n.catalog.iso19139.AbstractDQ_Element.evaluationMethodDescription</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractDQ_Element.evaluationProcedure&quot; '>i18n.catalog.iso19139.AbstractDQ_Element.evaluationProcedure</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractDQ_Element.dateTime&quot; '>i18n.catalog.iso19139.AbstractDQ_Element.dateTime</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractDQ_Element.result&quot; '>i18n.catalog.iso19139.AbstractDQ_Element.result</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_AbsoluteExternalPositionalAccuracy&quot; '>i18n.catalog.iso19139.DQ_AbsoluteExternalPositionalAccuracy</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_GriddedDataPositionalAccuracy&quot; '>i18n.catalog.iso19139.DQ_GriddedDataPositionalAccuracy</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_RelativeInternalPositionalAccuracy&quot; '>i18n.catalog.iso19139.DQ_RelativeInternalPositionalAccuracy</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_NonQuantitiveAttributeAccuracy&quot; '>i18n.catalog.iso19139.DQ_NonQuantitiveAttributeAccuracy</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_QuantitativeAttributeAccuracy&quot; '>i18n.catalog.iso19139.DQ_QuantitativeAttributeAccuracy</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_AccuracyOfATimeMeasurement&quot; '>i18n.catalog.iso19139.DQ_AccuracyOfATimeMeasurement</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_CompletenessOmission&quot; '>i18n.catalog.iso19139.DQ_CompletenessOmission</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_CompletenessCommission&quot; '>i18n.catalog.iso19139.DQ_CompletenessCommission</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_ConceptualConsistency&quot; '>i18n.catalog.iso19139.DQ_ConceptualConsistency</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_DomainConsistency&quot; '>i18n.catalog.iso19139.DQ_DomainConsistency</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_FormatConsistency&quot; '>i18n.catalog.iso19139.DQ_FormatConsistency</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_TemporalAccuracy&quot; '>i18n.catalog.iso19139.DQ_TemporalAccuracy</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_TemporalConsistency&quot; '>i18n.catalog.iso19139.DQ_TemporalConsistency</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_TemporalValidity&quot; '>i18n.catalog.iso19139.DQ_TemporalValidity</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_ThematicAccuracy&quot; '>i18n.catalog.iso19139.DQ_ThematicAccuracy</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_ThematicClassificationCorrectness&quot; '>i18n.catalog.iso19139.DQ_ThematicClassificationCorrectness</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_TopologicalConsistency&quot; '>i18n.catalog.iso19139.DQ_TopologicalConsistency</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_QuantitativeResult&quot; '>i18n.catalog.iso19139.DQ_QuantitativeResult</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_QuantitativeResult.valueType&quot; '>i18n.catalog.iso19139.DQ_QuantitativeResult.valueType</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_QuantitativeResult.errorStatistic&quot; '>i18n.catalog.iso19139.DQ_QuantitativeResult.errorStatistic</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_QuantitativeResult.value&quot; '>i18n.catalog.iso19139.DQ_QuantitativeResult.value</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_QuantitativeResult.valueUnit&quot; '>i18n.catalog.iso19139.DQ_QuantitativeResult.valueUnit</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_ConformanceResult&quot; '>i18n.catalog.iso19139.DQ_ConformanceResult</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_ConformanceResult.specification&quot; '>i18n.catalog.iso19139.DQ_ConformanceResult.specification</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_ConformanceResult.explanation&quot; '>i18n.catalog.iso19139.DQ_ConformanceResult.explanation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_ConformanceResult.pass&quot; '>i18n.catalog.iso19139.DQ_ConformanceResult.pass</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_ConformanceResult.pass.Boolean&quot; '>i18n.catalog.iso19139.DQ_ConformanceResult.pass.Boolean</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_ConformanceResult.pass.Boolean.true&quot; '>i18n.catalog.iso19139.DQ_ConformanceResult.pass.Boolean.true</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DQ_ConformanceResult.pass.Boolean.false&quot; '>i18n.catalog.iso19139.DQ_ConformanceResult.pass.Boolean.false</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.LI_Lineage&quot; '>i18n.catalog.iso19139.LI_Lineage</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.LI_Lineage.statement&quot; '>i18n.catalog.iso19139.LI_Lineage.statement</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.LI_Lineage.processStep&quot; '>i18n.catalog.iso19139.LI_Lineage.processStep</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.LI_Lineage.source&quot; '>i18n.catalog.iso19139.LI_Lineage.source</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.LI_ProcessStep&quot; '>i18n.catalog.iso19139.LI_ProcessStep</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.LI_ProcessStep.description&quot; '>i18n.catalog.iso19139.LI_ProcessStep.description</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.LI_ProcessStep.rationale&quot; '>i18n.catalog.iso19139.LI_ProcessStep.rationale</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.LI_ProcessStep.dateTime&quot; '>i18n.catalog.iso19139.LI_ProcessStep.dateTime</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.LI_ProcessStep.processor&quot; '>i18n.catalog.iso19139.LI_ProcessStep.processor</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.LI_ProcessStep.source&quot; '>i18n.catalog.iso19139.LI_ProcessStep.source</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.LI_Source&quot; '>i18n.catalog.iso19139.LI_Source</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.LI_Source.description&quot; '>i18n.catalog.iso19139.LI_Source.description</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.LI_Source.scaleDenominator&quot; '>i18n.catalog.iso19139.LI_Source.scaleDenominator</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.LI_Source.sourceReferenceSystem&quot; '>i18n.catalog.iso19139.LI_Source.sourceReferenceSystem</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.LI_Source.sourceCitation&quot; '>i18n.catalog.iso19139.LI_Source.sourceCitation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.LI_Source.sourceExtent&quot; '>i18n.catalog.iso19139.LI_Source.sourceExtent</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.LI_Source.sourceStep&quot; '>i18n.catalog.iso19139.LI_Source.sourceStep</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.XTN_Scope.level&quot; '>i18n.catalog.iso19139.XTN_Scope.level</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.AbstractTimePrimitive&quot; '>i18n.catalog.iso19139.AbstractTimePrimitive</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.StandardObjectProperties&quot; '>i18n.catalog.iso19139.StandardObjectProperties</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.StandardObjectProperties.metaDataProperty&quot; '>i18n.catalog.iso19139.StandardObjectProperties.metaDataProperty</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.StandardObjectProperties.description&quot; '>i18n.catalog.iso19139.StandardObjectProperties.description</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.StandardObjectProperties.descriptionReference&quot; '>i18n.catalog.iso19139.StandardObjectProperties.descriptionReference</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.StandardObjectProperties.name&quot; '>i18n.catalog.iso19139.StandardObjectProperties.name</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.StandardObjectProperties.identifier&quot; '>i18n.catalog.iso19139.StandardObjectProperties.identifier</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_FeatureCatalogueDescription&quot; '>i18n.catalog.iso19139.MD_FeatureCatalogueDescription</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_FeatureCatalogueDescription.complianceCode&quot; '>i18n.catalog.iso19139.MD_FeatureCatalogueDescription.complianceCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_FeatureCatalogueDescription.language&quot; '>i18n.catalog.iso19139.MD_FeatureCatalogueDescription.language</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_FeatureCatalogueDescription.includedWithDataset&quot; '>i18n.catalog.iso19139.MD_FeatureCatalogueDescription.includedWithDataset</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_FeatureCatalogueDescription.featureTypes&quot; '>i18n.catalog.iso19139.MD_FeatureCatalogueDescription.featureTypes</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_FeatureCatalogueDescription.featureCatalogueCitation&quot; '>i18n.catalog.iso19139.MD_FeatureCatalogueDescription.featureCatalogueCitation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CoverageDescription&quot; '>i18n.catalog.iso19139.MD_CoverageDescription</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CoverageDescription.attributeDescription&quot; '>i18n.catalog.iso19139.MD_CoverageDescription.attributeDescription</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CoverageDescription.contentType&quot; '>i18n.catalog.iso19139.MD_CoverageDescription.contentType</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CoverageDescription.dimension&quot; '>i18n.catalog.iso19139.MD_CoverageDescription.dimension</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CoverageContentTypeCode&quot; '>i18n.catalog.iso19139.MD_CoverageContentTypeCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CoverageContentTypeCode.image&quot; '>i18n.catalog.iso19139.MD_CoverageContentTypeCode.image</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CoverageContentTypeCode.thematicClassification&quot; '>i18n.catalog.iso19139.MD_CoverageContentTypeCode.thematicClassification</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_CoverageContentTypeCode.physicalMeasurement&quot; '>i18n.catalog.iso19139.MD_CoverageContentTypeCode.physicalMeasurement</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_RangeDimension&quot; '>i18n.catalog.iso19139.MD_RangeDimension</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_RangeDimension.sequenceIdentifier&quot; '>i18n.catalog.iso19139.MD_RangeDimension.sequenceIdentifier</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_RangeDimension.descriptor&quot; '>i18n.catalog.iso19139.MD_RangeDimension.descriptor</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Band&quot; '>i18n.catalog.iso19139.MD_Band</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Band.sequenceIdentifier&quot; '>i18n.catalog.iso19139.MD_Band.sequenceIdentifier</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Band.descriptor&quot; '>i18n.catalog.iso19139.MD_Band.descriptor</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Band.minValue&quot; '>i18n.catalog.iso19139.MD_Band.minValue</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Band.maxValue&quot; '>i18n.catalog.iso19139.MD_Band.maxValue</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Band.units&quot; '>i18n.catalog.iso19139.MD_Band.units</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Band.peakResponse&quot; '>i18n.catalog.iso19139.MD_Band.peakResponse</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Band.bitsPerValue&quot; '>i18n.catalog.iso19139.MD_Band.bitsPerValue</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Band.toneGradation&quot; '>i18n.catalog.iso19139.MD_Band.toneGradation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Band.scaleFactor&quot; '>i18n.catalog.iso19139.MD_Band.scaleFactor</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_Band.offset&quot; '>i18n.catalog.iso19139.MD_Band.offset</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ImageDescription&quot; '>i18n.catalog.iso19139.MD_ImageDescription</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ImageDescription.attributeDescription&quot; '>i18n.catalog.iso19139.MD_ImageDescription.attributeDescription</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ImageDescription.contentType&quot; '>i18n.catalog.iso19139.MD_ImageDescription.contentType</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ImageDescription.dimension&quot; '>i18n.catalog.iso19139.MD_ImageDescription.dimension</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ImageDescription.illuminationElevationAngle&quot; '>i18n.catalog.iso19139.MD_ImageDescription.illuminationElevationAngle</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ImageDescription.illuminationAzimuthAngle&quot; '>i18n.catalog.iso19139.MD_ImageDescription.illuminationAzimuthAngle</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ImageDescription.imagingCondition&quot; '>i18n.catalog.iso19139.MD_ImageDescription.imagingCondition</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ImageDescription.imageQualityCode&quot; '>i18n.catalog.iso19139.MD_ImageDescription.imageQualityCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ImageDescription.cloudCoverPercentage&quot; '>i18n.catalog.iso19139.MD_ImageDescription.cloudCoverPercentage</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ImageDescription.processingLevelCode&quot; '>i18n.catalog.iso19139.MD_ImageDescription.processingLevelCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ImageDescription.compressionGenerationQuantity&quot; '>i18n.catalog.iso19139.MD_ImageDescription.compressionGenerationQuantity</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ImageDescription.triangulationIndicator&quot; '>i18n.catalog.iso19139.MD_ImageDescription.triangulationIndicator</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ImageDescription.radiometricCalibrationDataAvailability&quot; '>i18n.catalog.iso19139.MD_ImageDescription.radiometricCalibrationDataAvailability</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ImageDescription.cameraCalibrationInformationAvailability&quot; '>i18n.catalog.iso19139.MD_ImageDescription.cameraCalibrationInformationAvailability</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ImageDescription.filmDistortionInformationAvailability&quot; '>i18n.catalog.iso19139.MD_ImageDescription.filmDistortionInformationAvailability</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ImageDescription.lensDistortionInformationAvailability&quot; '>i18n.catalog.iso19139.MD_ImageDescription.lensDistortionInformationAvailability</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ImagingConditionCode&quot; '>i18n.catalog.iso19139.MD_ImagingConditionCode</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ImagingConditionCode.blurredImage&quot; '>i18n.catalog.iso19139.MD_ImagingConditionCode.blurredImage</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ImagingConditionCode.cloud&quot; '>i18n.catalog.iso19139.MD_ImagingConditionCode.cloud</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ImagingConditionCode.degradingObliquity&quot; '>i18n.catalog.iso19139.MD_ImagingConditionCode.degradingObliquity</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ImagingConditionCode.fog&quot; '>i18n.catalog.iso19139.MD_ImagingConditionCode.fog</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ImagingConditionCode.heavySmokeOrDust&quot; '>i18n.catalog.iso19139.MD_ImagingConditionCode.heavySmokeOrDust</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ImagingConditionCode.night&quot; '>i18n.catalog.iso19139.MD_ImagingConditionCode.night</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ImagingConditionCode.rain&quot; '>i18n.catalog.iso19139.MD_ImagingConditionCode.rain</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ImagingConditionCode.semiDarkness&quot; '>i18n.catalog.iso19139.MD_ImagingConditionCode.semiDarkness</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ImagingConditionCode.shadow&quot; '>i18n.catalog.iso19139.MD_ImagingConditionCode.shadow</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.MD_ImagingConditionCode.snow&quot; '>i18n.catalog.iso19139.MD_ImagingConditionCode.snow</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_Operation&quot; '>i18n.catalog.iso19139.SV_Operation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_Operation.operationName&quot; '>i18n.catalog.iso19139.SV_Operation.operationName</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_Operation.dependsOn&quot; '>i18n.catalog.iso19139.SV_Operation.dependsOn</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_Operation.parameter&quot; '>i18n.catalog.iso19139.SV_Operation.parameter</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_PortSpecification&quot; '>i18n.catalog.iso19139.SV_PortSpecification</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_PortSpecification.binding&quot; '>i18n.catalog.iso19139.SV_PortSpecification.binding</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_PortSpecification.address&quot; '>i18n.catalog.iso19139.SV_PortSpecification.address</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_Interface&quot; '>i18n.catalog.iso19139.SV_Interface</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_Interface.typeName&quot; '>i18n.catalog.iso19139.SV_Interface.typeName</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_Interface.theSV_Port&quot; '>i18n.catalog.iso19139.SV_Interface.theSV_Port</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_Interface.operation&quot; '>i18n.catalog.iso19139.SV_Interface.operation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_Service&quot; '>i18n.catalog.iso19139.SV_Service</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_Service.specification&quot; '>i18n.catalog.iso19139.SV_Service.specification</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_Service.theSV_Port&quot; '>i18n.catalog.iso19139.SV_Service.theSV_Port</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_Port&quot; '>i18n.catalog.iso19139.SV_Port</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_Port.theSV_Interface&quot; '>i18n.catalog.iso19139.SV_Port.theSV_Interface</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_ServiceType&quot; '>i18n.catalog.iso19139.SV_ServiceType</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_ServiceSpecification&quot; '>i18n.catalog.iso19139.SV_ServiceSpecification</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_ServiceSpecification.name&quot; '>i18n.catalog.iso19139.SV_ServiceSpecification.name</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_ServiceSpecification.opModel&quot; '>i18n.catalog.iso19139.SV_ServiceSpecification.opModel</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_ServiceSpecification.typeSpec&quot; '>i18n.catalog.iso19139.SV_ServiceSpecification.typeSpec</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_ServiceSpecification.theSV_Interface&quot; '>i18n.catalog.iso19139.SV_ServiceSpecification.theSV_Interface</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_PlatformNeutralServiceSpecification&quot; '>i18n.catalog.iso19139.SV_PlatformNeutralServiceSpecification</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_PlatformNeutralServiceSpecification.name&quot; '>i18n.catalog.iso19139.SV_PlatformNeutralServiceSpecification.name</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_PlatformNeutralServiceSpecification.opModel&quot; '>i18n.catalog.iso19139.SV_PlatformNeutralServiceSpecification.opModel</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_PlatformNeutralServiceSpecification.serviceType&quot; '>i18n.catalog.iso19139.SV_PlatformNeutralServiceSpecification.serviceType</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_PlatformNeutralServiceSpecification.implSpec&quot; '>i18n.catalog.iso19139.SV_PlatformNeutralServiceSpecification.implSpec</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_PlatformSpecificServiceSpecification&quot; '>i18n.catalog.iso19139.SV_PlatformSpecificServiceSpecification</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_PlatformSpecificServiceSpecification.name&quot; '>i18n.catalog.iso19139.SV_PlatformSpecificServiceSpecification.name</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_PlatformSpecificServiceSpecification.opModel&quot; '>i18n.catalog.iso19139.SV_PlatformSpecificServiceSpecification.opModel</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_PlatformSpecificServiceSpecification.serviceType&quot; '>i18n.catalog.iso19139.SV_PlatformSpecificServiceSpecification.serviceType</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_PlatformSpecificServiceSpecification.implSpec&quot; '>i18n.catalog.iso19139.SV_PlatformSpecificServiceSpecification.implSpec</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_PlatformSpecificServiceSpecification.DCP&quot; '>i18n.catalog.iso19139.SV_PlatformSpecificServiceSpecification.DCP</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_PlatformSpecificServiceSpecification.implementation&quot; '>i18n.catalog.iso19139.SV_PlatformSpecificServiceSpecification.implementation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_ParameterDirection&quot; '>i18n.catalog.iso19139.SV_ParameterDirection</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_Paramater&quot; '>i18n.catalog.iso19139.SV_Paramater</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_Paramater.name&quot; '>i18n.catalog.iso19139.SV_Paramater.name</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_Paramater.direction&quot; '>i18n.catalog.iso19139.SV_Paramater.direction</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_Paramater.description&quot; '>i18n.catalog.iso19139.SV_Paramater.description</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_Paramater.optionality&quot; '>i18n.catalog.iso19139.SV_Paramater.optionality</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_Paramater.repeatability&quot; '>i18n.catalog.iso19139.SV_Paramater.repeatability</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_Paramater.valueType&quot; '>i18n.catalog.iso19139.SV_Paramater.valueType</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DCPList&quot; '>i18n.catalog.iso19139.DCPList</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DCPList.XML&quot; '>i18n.catalog.iso19139.DCPList.XML</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DCPList.CORBA&quot; '>i18n.catalog.iso19139.DCPList.CORBA</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DCPList.JAVA&quot; '>i18n.catalog.iso19139.DCPList.JAVA</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DCPList.COM&quot; '>i18n.catalog.iso19139.DCPList.COM</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DCPList.SQL&quot; '>i18n.catalog.iso19139.DCPList.SQL</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.DCPList.WebServices&quot; '>i18n.catalog.iso19139.DCPList.WebServices</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_OperationMetadata&quot; '>i18n.catalog.iso19139.SV_OperationMetadata</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_OperationMetadata.operationName&quot; '>i18n.catalog.iso19139.SV_OperationMetadata.operationName</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_OperationMetadata.DCP&quot; '>i18n.catalog.iso19139.SV_OperationMetadata.DCP</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_OperationMetadata.operationDescription&quot; '>i18n.catalog.iso19139.SV_OperationMetadata.operationDescription</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_OperationMetadata.invocationName&quot; '>i18n.catalog.iso19139.SV_OperationMetadata.invocationName</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_OperationMetadata.parameters&quot; '>i18n.catalog.iso19139.SV_OperationMetadata.parameters</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_OperationMetadata.connectPoint&quot; '>i18n.catalog.iso19139.SV_OperationMetadata.connectPoint</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_OperationMetadata.dependsOn&quot; '>i18n.catalog.iso19139.SV_OperationMetadata.dependsOn</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_CoupledResource&quot; '>i18n.catalog.iso19139.SV_CoupledResource</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_CoupledResource.operationName&quot; '>i18n.catalog.iso19139.SV_CoupledResource.operationName</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_CoupledResource.identifier&quot; '>i18n.catalog.iso19139.SV_CoupledResource.identifier</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_OperationChainMetadata&quot; '>i18n.catalog.iso19139.SV_OperationChainMetadata</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_OperationChainMetadata.name&quot; '>i18n.catalog.iso19139.SV_OperationChainMetadata.name</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_OperationChainMetadata.description&quot; '>i18n.catalog.iso19139.SV_OperationChainMetadata.description</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_OperationChainMetadata.operation&quot; '>i18n.catalog.iso19139.SV_OperationChainMetadata.operation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_OperationChain&quot; '>i18n.catalog.iso19139.SV_OperationChain</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_OperationChain.name&quot; '>i18n.catalog.iso19139.SV_OperationChain.name</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_OperationChain.description&quot; '>i18n.catalog.iso19139.SV_OperationChain.description</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_OperationChain.operation&quot; '>i18n.catalog.iso19139.SV_OperationChain.operation</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_ServiceIdentification&quot; '>i18n.catalog.iso19139.SV_ServiceIdentification</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_ServiceIdentification.serviceType&quot; '>i18n.catalog.iso19139.SV_ServiceIdentification.serviceType</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_ServiceIdentification.serviceTypeVersion&quot; '>i18n.catalog.iso19139.SV_ServiceIdentification.serviceTypeVersion</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_ServiceIdentification.accessProperties&quot; '>i18n.catalog.iso19139.SV_ServiceIdentification.accessProperties</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_ServiceIdentification.restrictions&quot; '>i18n.catalog.iso19139.SV_ServiceIdentification.restrictions</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_ServiceIdentification.keywords&quot; '>i18n.catalog.iso19139.SV_ServiceIdentification.keywords</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_ServiceIdentification.extent&quot; '>i18n.catalog.iso19139.SV_ServiceIdentification.extent</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_ServiceIdentification.coupledResource&quot; '>i18n.catalog.iso19139.SV_ServiceIdentification.coupledResource</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_ServiceIdentification.couplingType&quot; '>i18n.catalog.iso19139.SV_ServiceIdentification.couplingType</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_ServiceIdentification.containsOperations&quot; '>i18n.catalog.iso19139.SV_ServiceIdentification.containsOperations</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_ServiceIdentification.operatesOn&quot; '>i18n.catalog.iso19139.SV_ServiceIdentification.operatesOn</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_CouplingType&quot; '>i18n.catalog.iso19139.SV_CouplingType</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_CouplingType.loose&quot; '>i18n.catalog.iso19139.SV_CouplingType.loose</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_CouplingType.mixed&quot; '>i18n.catalog.iso19139.SV_CouplingType.mixed</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.SV_CouplingType.tight&quot; '>i18n.catalog.iso19139.SV_CouplingType.tight</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.EX_GeographicDescription&quot; '>i18n.catalog.iso19139.EX_GeographicDescription</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.EX_GeographicDescription.geographicIdentifier&quot; '>i18n.catalog.iso19139.EX_GeographicDescription.geographicIdentifier</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.EX_VerticalExtent.verticalCRS.href&quot; '>i18n.catalog.iso19139.EX_VerticalExtent.verticalCRS.href</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.TM_Primitive.indeterminatePosition&quot; '>i18n.catalog.iso19139.TM_Primitive.indeterminatePosition</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.TM_Primitive.indeterminatePosition.before&quot; '>i18n.catalog.iso19139.TM_Primitive.indeterminatePosition.before</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.TM_Primitive.indeterminatePosition.after&quot; '>i18n.catalog.iso19139.TM_Primitive.indeterminatePosition.after</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.TM_Primitive.indeterminatePosition.now&quot; '>i18n.catalog.iso19139.TM_Primitive.indeterminatePosition.now</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.TM_Primitive.indeterminatePosition.unknown&quot; '>i18n.catalog.iso19139.TM_Primitive.indeterminatePosition.unknown</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.object.uuidref&quot; '>i18n.catalog.iso19139.object.uuidref</xsl:when>
			<xsl:when test=' $key = &quot;catalog.iso19139.object.xlink.href&quot; '>i18n.catalog.iso19139.object.xlink.href</xsl:when>
			<!-- ISO 639-2 language code -->
			<xsl:when test=' $key = &quot;catalog.mdCode.language.iso639_2.ger&quot; '>i18n.catalog.mdCode.language.iso639_2.ger</xsl:when>
			<xsl:when test=' $key = &quot;catalog.mdCode.language.iso639_2.dut&quot; '>i18n.catalog.mdCode.language.iso639_2.dut</xsl:when>
			<xsl:when test=' $key = &quot;catalog.mdCode.language.iso639_2.eng&quot; '>i18n.catalog.mdCode.language.iso639_2.eng</xsl:when>
			<xsl:when test=' $key = &quot;catalog.mdCode.language.iso639_2.fre&quot; '>i18n.catalog.mdCode.language.iso639_2.fre</xsl:when>
			<xsl:when test=' $key = &quot;catalog.mdCode.language.iso639_2.ita&quot; '>i18n.catalog.mdCode.language.iso639_2.ita</xsl:when>			
			<xsl:when test=' $key = &quot;catalog.mdCode.language.iso639_2.kor&quot; '>i18n.catalog.mdCode.language.iso639_2.kor</xsl:when>
			<xsl:when test=' $key = &quot;catalog.mdCode.language.iso639_2.lit&quot; '>i18n.catalog.mdCode.language.iso639_2.lit</xsl:when>
			<xsl:when test=' $key = &quot;catalog.mdCode.language.iso639_2.nor&quot; '>i18n.catalog.mdCode.language.iso639_2.nor</xsl:when>			
			<xsl:when test=' $key = &quot;catalog.mdCode.language.iso639_2.pol&quot; '>i18n.catalog.mdCode.language.iso639_2.pol</xsl:when>			
			<xsl:when test=' $key = &quot;catalog.mdCode.language.iso639_2.por&quot; '>i18n.catalog.mdCode.language.iso639_2.por</xsl:when>
			<xsl:when test=' $key = &quot;catalog.mdCode.language.iso639_2.rus&quot; '>i18n.catalog.mdCode.language.iso639_2.rus</xsl:when>
			<xsl:when test=' $key = &quot;catalog.mdCode.language.iso639_2.spa&quot; '>i18n.catalog.mdCode.language.iso639_2.spa</xsl:when>
			<xsl:when test=' $key = &quot;catalog.mdCode.language.iso639_2.swe&quot; '>i18n.catalog.mdCode.language.iso639_2.swe</xsl:when>
			<xsl:when test=' $key = &quot;catalog.mdCode.language.iso639_2.tur&quot; '>i18n.catalog.mdCode.language.iso639_2.tur</xsl:when>
			<xsl:when test=' $key = &quot;catalog.mdCode.language.iso639_2.chi&quot; '>i18n.catalog.mdCode.language.iso639_2.chi</xsl:when>
			<xsl:when test=' $key = &quot;catalog.mdCode.language.iso639_2.bul&quot; '>i18n.catalog.mdCode.language.iso639_2.bul</xsl:when>
			<xsl:when test=' $key = &quot;catalog.mdCode.language.iso639_2.cze&quot; '>i18n.catalog.mdCode.language.iso639_2.cze</xsl:when>
			<xsl:when test=' $key = &quot;catalog.mdCode.language.iso639_2.dan&quot; '>i18n.catalog.mdCode.language.iso639_2.dan</xsl:when>
			<xsl:when test=' $key = &quot;catalog.mdCode.language.iso639_2.est&quot; '>i18n.catalog.mdCode.language.iso639_2.est</xsl:when>
			<xsl:when test=' $key = &quot;catalog.mdCode.language.iso639_2.fin&quot; '>i18n.catalog.mdCode.language.iso639_2.fin</xsl:when>
			<xsl:when test=' $key = &quot;catalog.mdCode.language.iso639_2.gre&quot; '>i18n.catalog.mdCode.language.iso639_2.gre</xsl:when>
			<xsl:when test=' $key = &quot;catalog.mdCode.language.iso639_2.hun&quot; '>i18n.catalog.mdCode.language.iso639_2.hun</xsl:when>
			<xsl:when test=' $key = &quot;catalog.mdCode.language.iso639_2.gle&quot; '>i18n.catalog.mdCode.language.iso639_2.gle</xsl:when>
			<xsl:when test=' $key = &quot;catalog.mdCode.language.iso639_2.lav&quot; '>i18n.catalog.mdCode.language.iso639_2.lav</xsl:when>
			<xsl:when test=' $key = &quot;catalog.mdCode.language.iso639_2.mlt&quot; '>i18n.catalog.mdCode.language.iso639_2.mlt</xsl:when>
			<xsl:when test=' $key = &quot;catalog.mdCode.language.iso639_2.rum&quot; '>i18n.catalog.mdCode.language.iso639_2.rum</xsl:when>
			<xsl:when test=' $key = &quot;catalog.mdCode.language.iso639_2.slo&quot; '>i18n.catalog.mdCode.language.iso639_2.slo</xsl:when>
			<xsl:when test=' $key = &quot;catalog.mdCode.language.iso639_2.slv&quot; '>i18n.catalog.mdCode.language.iso639_2.slv</xsl:when>
			
			<xsl:when test=' $key = &quot;catalog.gemini.MD_Metadata.hierarchyLevel&quot; '>i18n.catalog.gemini.MD_Metadata.hierarchyLevel</xsl:when>
			
		</xsl:choose>	
	</xsl:template>
</xsl:stylesheet>