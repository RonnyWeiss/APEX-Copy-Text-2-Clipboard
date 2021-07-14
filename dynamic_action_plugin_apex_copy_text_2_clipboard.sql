prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_210100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2016.08.24'
,p_release=>'5.1.3.00.05'
,p_default_workspace_id=>21717127411908241868
,p_default_application_id=>103428
,p_default_owner=>'RD_DEV'
);
end;
/

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/dynamic_action/apex_copy_text_2_clipboard
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(6631450875265787206)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'APEX.COPY.TEXT.2.CLIPBOARD'
,p_display_name=>'APEX Copy Text to Clippboard'
,p_category=>'EXECUTE'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'FUNCTION F_RENDER (',
'    P_DYNAMIC_ACTION   IN APEX_PLUGIN.T_DYNAMIC_ACTION,',
'    P_PLUGIN           IN APEX_PLUGIN.T_PLUGIN',
') RETURN APEX_PLUGIN.T_DYNAMIC_ACTION_RENDER_RESULT AS',
'    VR_RESULT         APEX_PLUGIN.T_DYNAMIC_ACTION_RENDER_RESULT;',
'BEGIN',
'',
'    APEX_JAVASCRIPT.ADD_LIBRARY(',
'        P_NAME        => ''script.min'',',
'        P_DIRECTORY   => P_PLUGIN.FILE_PREFIX,',
'        P_VERSION     => NULL,',
'        P_KEY         => ''copy2ClipboardScript''',
'    );',
'',
'    VR_RESULT.JAVASCRIPT_FUNCTION   := ''',
'    function () { ',
'           apexCopy2ClipBoard(this, '' ||',
'                   APEX_JAVASCRIPT.ADD_VALUE( P_DYNAMIC_ACTION.ATTRIBUTE_01, TRUE ) ||',
'                   APEX_JAVASCRIPT.ADD_VALUE( P_DYNAMIC_ACTION.ATTRIBUTE_02, TRUE ) ||',
'                   APEX_JAVASCRIPT.ADD_VALUE( P_DYNAMIC_ACTION.ATTRIBUTE_03, FALSE ) ||',
'    ''); }'';',
'',
'    RETURN VR_RESULT;',
'END;'))
,p_api_version=>2
,p_render_function=>'F_RENDER'
,p_standard_attributes=>'ITEM:JQUERY_SELECTOR:EVENT_SOURCE'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>'This plug-in is to copy text from an element on the page to ClipBoard.'
,p_version_identifier=>'1.0.5'
,p_about_url=>'https://github.com/RonnyWeiss/APEX-Copy-Text-2-Clipboard'
,p_files_version=>17
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(6631457298473844086)
,p_plugin_id=>wwv_flow_api.id(6631450875265787206)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Duration for Info Message (ms)'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'2000'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
,p_help_text=>'Here you can set the Duration for Info Message. IF set to 0 then Info Message is not shown.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(6634370222361696394)
,p_plugin_id=>wwv_flow_api.id(6631450875265787206)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Message after Value'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'%0 copied to Clipboard!'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>true
,p_examples=>'%0 copied to Clipboard!'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(6634385573941795672)
,p_plugin_id=>wwv_flow_api.id(6631450875265787206)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Cut Value after'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'15'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
,p_examples=>'15'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '66756E6374696F6E2061706578436F707932436C6970426F61726428652C612C742C6F297B766172206E3D66756E6374696F6E2865297B72657475726E20766F69642030213D3D6526266E756C6C213D3D6526262222213D657D2C693D66756E6374696F';
wwv_flow_api.g_varchar2_table(2) := '6E28652C61297B7472797B72657475726E20613C303F653A652E6C656E6774683E613F652E737562737472696E6728302C612D33292B222E2E2E223A657D63617463682861297B72657475726E20657D7D3B2866756E6374696F6E2865297B7661722061';
wwv_flow_api.g_varchar2_table(3) := '3D2428223C696E7075743E22293B242822626F647922292E617070656E642861293B76617220743D242865292E7465787428297C7C242865292E76616C28293B612E76616C2874292E73656C65637428292C646F63756D656E742E65786563436F6D6D61';
wwv_flow_api.g_varchar2_table(4) := '6E642822636F707922292C612E72656D6F766528297D2928652E6166666563746564456C656D656E7473293B76617220723D2428652E6166666563746564456C656D656E7473292E7465787428297C7C2428652E6166666563746564456C656D656E7473';
wwv_flow_api.g_varchar2_table(5) := '292E76616C28293B28617C7C30293E3026266E287229262628617065782E6D6573736167652E73686F77506167655375636365737328742E7265706C61636528222530222C6928722C6F7C7C31352929292C77696E646F772E61706578436F707932436C';
wwv_flow_api.g_varchar2_table(6) := '6970426F61726454696D65723F28636C65617254696D656F75742877696E646F772E61706578436F707932436C6970426F61726454696D6572292C77696E646F772E61706578436F707932436C6970426F61726454696D65723D73657454696D656F7574';
wwv_flow_api.g_varchar2_table(7) := '2866756E6374696F6E28297B617065782E6D6573736167652E68696465506167655375636365737328297D2C6129293A77696E646F772E61706578436F707932436C6970426F61726454696D65723D73657454696D656F75742866756E6374696F6E2829';
wwv_flow_api.g_varchar2_table(8) := '7B617065782E6D6573736167652E68696465506167655375636365737328297D2C6129297D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(6634387171623808042)
,p_plugin_id=>wwv_flow_api.id(6631450875265787206)
,p_file_name=>'script.min.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '4D4954204C6963656E73650A0A436F7079726967687420286329203230323120526F6E6E792057656973730A0A5065726D697373696F6E20697320686572656279206772616E7465642C2066726565206F66206368617267652C20746F20616E79207065';
wwv_flow_api.g_varchar2_table(2) := '72736F6E206F627461696E696E67206120636F70790A6F66207468697320736F66747761726520616E64206173736F63696174656420646F63756D656E746174696F6E2066696C657320287468652022536F66747761726522292C20746F206465616C0A';
wwv_flow_api.g_varchar2_table(3) := '696E2074686520536F66747761726520776974686F7574207265737472696374696F6E2C20696E636C7564696E6720776974686F7574206C696D69746174696F6E20746865207269676874730A746F207573652C20636F70792C206D6F646966792C206D';
wwv_flow_api.g_varchar2_table(4) := '657267652C207075626C6973682C20646973747269627574652C207375626C6963656E73652C20616E642F6F722073656C6C0A636F70696573206F662074686520536F6674776172652C20616E6420746F207065726D697420706572736F6E7320746F20';
wwv_flow_api.g_varchar2_table(5) := '77686F6D2074686520536F6674776172652069730A6675726E697368656420746F20646F20736F2C207375626A65637420746F2074686520666F6C6C6F77696E6720636F6E646974696F6E733A0A0A5468652061626F766520636F70797269676874206E';
wwv_flow_api.g_varchar2_table(6) := '6F7469636520616E642074686973207065726D697373696F6E206E6F74696365207368616C6C20626520696E636C7564656420696E20616C6C0A636F70696573206F72207375627374616E7469616C20706F7274696F6E73206F662074686520536F6674';
wwv_flow_api.g_varchar2_table(7) := '776172652E0A0A54484520534F4654574152452049532050524F564944454420224153204953222C20574954484F55542057415252414E5459204F4620414E59204B494E442C2045585052455353204F520A494D504C4945442C20494E434C5544494E47';
wwv_flow_api.g_varchar2_table(8) := '20425554204E4F54204C494D4954454420544F205448452057415252414E54494553204F46204D45524348414E544142494C4954592C0A4649544E45535320464F52204120504152544943554C415220505552504F534520414E44204E4F4E494E465249';
wwv_flow_api.g_varchar2_table(9) := '4E47454D454E542E20494E204E4F204556454E54205348414C4C205448450A415554484F5253204F5220434F5059524947485420484F4C44455253204245204C4941424C4520464F5220414E5920434C41494D2C2044414D41474553204F52204F544845';
wwv_flow_api.g_varchar2_table(10) := '520A4C494142494C4954592C205748455448455220494E20414E20414354494F4E204F4620434F4E54524143542C20544F5254204F52204F54484552574953452C2041524953494E472046524F4D2C0A4F5554204F46204F5220494E20434F4E4E454354';
wwv_flow_api.g_varchar2_table(11) := '494F4E20574954482054484520534F465457415245204F522054484520555345204F52204F54484552204445414C494E475320494E205448450A534F4654574152452E0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(31957376228277492034)
,p_plugin_id=>wwv_flow_api.id(6631450875265787206)
,p_file_name=>'LICENSE'
,p_mime_type=>'application/octet-stream'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
