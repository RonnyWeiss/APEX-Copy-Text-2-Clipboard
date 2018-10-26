prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_180200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2018.05.24'
,p_release=>'18.2.0.00.12'
,p_default_workspace_id=>21717127411908241868
,p_default_application_id=>103428
,p_default_owner=>'RD_DEV'
);
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
'        P_DYNAMIC_ACTION   IN APEX_PLUGIN.T_DYNAMIC_ACTION,',
'        P_PLUGIN           IN APEX_PLUGIN.T_PLUGIN',
'    ) RETURN APEX_PLUGIN.T_DYNAMIC_ACTION_RENDER_RESULT AS',
'        VR_RESULT         APEX_PLUGIN.T_DYNAMIC_ACTION_RENDER_RESULT;',
'    BEGIN',
'',
'        APEX_JAVASCRIPT.ADD_LIBRARY(',
'            P_NAME        => ''script.min'',',
'            P_DIRECTORY   => P_PLUGIN.FILE_PREFIX,',
'            P_VERSION     => NULL,',
'            P_KEY         => ''copy2ClipboardScript''',
'        );',
'',
'        VR_RESULT.JAVASCRIPT_FUNCTION   := ''',
'        function () { ',
'               apexCopy2ClipBoard(this, '' ||',
'                       APEX_JAVASCRIPT.ADD_VALUE( P_DYNAMIC_ACTION.ATTRIBUTE_01, TRUE ) ||',
'                       APEX_JAVASCRIPT.ADD_VALUE( P_DYNAMIC_ACTION.ATTRIBUTE_02, TRUE ) ||',
'                       APEX_JAVASCRIPT.ADD_VALUE( P_DYNAMIC_ACTION.ATTRIBUTE_03, FALSE ) ||',
'        ''); }'';',
'',
'        RETURN VR_RESULT;',
'    END;'))
,p_api_version=>2
,p_render_function=>'F_RENDER'
,p_standard_attributes=>'ITEM:JQUERY_SELECTOR'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>'This plug-in is to copy text from an element on the page to ClipBoard.'
,p_version_identifier=>'1.0'
,p_about_url=>'https://github.com/RonnyWeiss/APEX-Copy-Text-2-Clipboard'
,p_files_version=>7
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
wwv_flow_api.g_varchar2_table(1) := '4D4954204C6963656E73650A0A436F7079726967687420286329203230313820526F6E6E792057656973730A0A5065726D697373696F6E20697320686572656279206772616E7465642C2066726565206F66206368617267652C20746F20616E79207065';
wwv_flow_api.g_varchar2_table(2) := '72736F6E206F627461696E696E67206120636F70790A6F66207468697320736F66747761726520616E64206173736F63696174656420646F63756D656E746174696F6E2066696C657320287468652022536F66747761726522292C20746F206465616C0A';
wwv_flow_api.g_varchar2_table(3) := '696E2074686520536F66747761726520776974686F7574207265737472696374696F6E2C20696E636C7564696E6720776974686F7574206C696D69746174696F6E20746865207269676874730A746F207573652C20636F70792C206D6F646966792C206D';
wwv_flow_api.g_varchar2_table(4) := '657267652C207075626C6973682C20646973747269627574652C207375626C6963656E73652C20616E642F6F722073656C6C0A636F70696573206F662074686520536F6674776172652C20616E6420746F207065726D697420706572736F6E7320746F20';
wwv_flow_api.g_varchar2_table(5) := '77686F6D2074686520536F6674776172652069730A6675726E697368656420746F20646F20736F2C207375626A65637420746F2074686520666F6C6C6F77696E6720636F6E646974696F6E733A0A0A5468652061626F766520636F70797269676874206E';
wwv_flow_api.g_varchar2_table(6) := '6F7469636520616E642074686973207065726D697373696F6E206E6F74696365207368616C6C20626520696E636C7564656420696E20616C6C0A636F70696573206F72207375627374616E7469616C20706F7274696F6E73206F662074686520536F6674';
wwv_flow_api.g_varchar2_table(7) := '776172652E0A0A54484520534F4654574152452049532050524F564944454420224153204953222C20574954484F55542057415252414E5459204F4620414E59204B494E442C2045585052455353204F520A494D504C4945442C20494E434C5544494E47';
wwv_flow_api.g_varchar2_table(8) := '20425554204E4F54204C494D4954454420544F205448452057415252414E54494553204F46204D45524348414E544142494C4954592C0A4649544E45535320464F52204120504152544943554C415220505552504F534520414E44204E4F4E494E465249';
wwv_flow_api.g_varchar2_table(9) := '4E47454D454E542E20494E204E4F204556454E54205348414C4C205448450A415554484F5253204F5220434F5059524947485420484F4C44455253204245204C4941424C4520464F5220414E5920434C41494D2C2044414D41474553204F52204F544845';
wwv_flow_api.g_varchar2_table(10) := '520A4C494142494C4954592C205748455448455220494E20414E20414354494F4E204F4620434F4E54524143542C20544F5254204F52204F54484552574953452C2041524953494E472046524F4D2C0A4F5554204F46204F5220494E20434F4E4E454354';
wwv_flow_api.g_varchar2_table(11) := '494F4E20574954482054484520534F465457415245204F522054484520555345204F52204F54484552204445414C494E475320494E205448450A534F4654574152452E0A0A6A51756572793A0A0A68747470733A2F2F6769746875622E636F6D2F6A7175';
wwv_flow_api.g_varchar2_table(12) := '6572792F6A71756572793A0A0A436F70797269676874204A5320466F756E646174696F6E20616E64206F7468657220636F6E7472696275746F72732C2068747470733A2F2F6A732E666F756E646174696F6E2F0A0A5468697320736F6674776172652063';
wwv_flow_api.g_varchar2_table(13) := '6F6E7369737473206F6620766F6C756E7461727920636F6E747269627574696F6E73206D616465206279206D616E790A696E646976696475616C732E20466F7220657861637420636F6E747269627574696F6E20686973746F72792C2073656520746865';
wwv_flow_api.g_varchar2_table(14) := '207265766973696F6E20686973746F72790A617661696C61626C652061742068747470733A2F2F6769746875622E636F6D2F6A71756572792F6A71756572790A0A54686520666F6C6C6F77696E67206C6963656E7365206170706C69657320746F20616C';
wwv_flow_api.g_varchar2_table(15) := '6C207061727473206F66207468697320736F667477617265206578636570742061730A646F63756D656E7465642062656C6F773A0A0A3D3D3D3D0A0A5065726D697373696F6E20697320686572656279206772616E7465642C2066726565206F66206368';
wwv_flow_api.g_varchar2_table(16) := '617267652C20746F20616E7920706572736F6E206F627461696E696E670A6120636F7079206F66207468697320736F66747761726520616E64206173736F63696174656420646F63756D656E746174696F6E2066696C657320287468650A22536F667477';
wwv_flow_api.g_varchar2_table(17) := '61726522292C20746F206465616C20696E2074686520536F66747761726520776974686F7574207265737472696374696F6E2C20696E636C7564696E670A776974686F7574206C696D69746174696F6E207468652072696768747320746F207573652C20';
wwv_flow_api.g_varchar2_table(18) := '636F70792C206D6F646966792C206D657267652C207075626C6973682C0A646973747269627574652C207375626C6963656E73652C20616E642F6F722073656C6C20636F70696573206F662074686520536F6674776172652C20616E6420746F0A706572';
wwv_flow_api.g_varchar2_table(19) := '6D697420706572736F6E7320746F2077686F6D2074686520536F667477617265206973206675726E697368656420746F20646F20736F2C207375626A65637420746F0A74686520666F6C6C6F77696E6720636F6E646974696F6E733A0A0A546865206162';
wwv_flow_api.g_varchar2_table(20) := '6F766520636F70797269676874206E6F7469636520616E642074686973207065726D697373696F6E206E6F74696365207368616C6C2062650A696E636C7564656420696E20616C6C20636F70696573206F72207375627374616E7469616C20706F727469';
wwv_flow_api.g_varchar2_table(21) := '6F6E73206F662074686520536F6674776172652E0A0A54484520534F4654574152452049532050524F564944454420224153204953222C20574954484F55542057415252414E5459204F4620414E59204B494E442C0A45585052455353204F5220494D50';
wwv_flow_api.g_varchar2_table(22) := '4C4945442C20494E434C5544494E4720425554204E4F54204C494D4954454420544F205448452057415252414E54494553204F460A4D45524348414E544142494C4954592C204649544E45535320464F52204120504152544943554C415220505552504F';
wwv_flow_api.g_varchar2_table(23) := '534520414E440A4E4F4E494E4652494E47454D454E542E20494E204E4F204556454E54205348414C4C2054484520415554484F5253204F5220434F5059524947485420484F4C444552532042450A4C4941424C4520464F5220414E5920434C41494D2C20';
wwv_flow_api.g_varchar2_table(24) := '44414D41474553204F52204F54484552204C494142494C4954592C205748455448455220494E20414E20414354494F4E0A4F4620434F4E54524143542C20544F5254204F52204F54484552574953452C2041524953494E472046524F4D2C204F5554204F';
wwv_flow_api.g_varchar2_table(25) := '46204F5220494E20434F4E4E454354494F4E0A574954482054484520534F465457415245204F522054484520555345204F52204F54484552204445414C494E475320494E2054484520534F4654574152452E0A0A3D3D3D3D0A0A416C6C2066696C657320';
wwv_flow_api.g_varchar2_table(26) := '6C6F636174656420696E20746865206E6F64655F6D6F64756C657320616E642065787465726E616C206469726563746F72696573206172650A65787465726E616C6C79206D61696E7461696E6564206C6962726172696573207573656420627920746869';
wwv_flow_api.g_varchar2_table(27) := '7320736F66747761726520776869636820686176652074686569720A6F776E206C6963656E7365733B207765207265636F6D6D656E6420796F752072656164207468656D2C206173207468656972207465726D73206D6179206469666665722066726F6D';
wwv_flow_api.g_varchar2_table(28) := '0A746865207465726D732061626F76652E';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(6631452267721787228)
,p_plugin_id=>wwv_flow_api.id(6631450875265787206)
,p_file_name=>'LICENSE'
,p_mime_type=>'application/octet-stream'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '66756E6374696F6E2061706578436F707932436C6970426F61726428652C742C612C63297B766172206E3D2428223C696E7075743E22293B242822626F647922292E617070656E64286E293B76617220733D2428652E6166666563746564456C656D656E';
wwv_flow_api.g_varchar2_table(2) := '7473292E7465787428297C7C2428652E6166666563746564456C656D656E7473292E76616C28293B6E2E76616C2873292E73656C65637428292C646F63756D656E742E65786563436F6D6D616E642822636F707922292C6E2E72656D6F766528292C2874';
wwv_flow_api.g_varchar2_table(3) := '7C7C30293E30262673262628617065782E6D6573736167652E73686F77506167655375636365737328612E7265706C61636528222530222C66756E6374696F6E28652C74297B7472797B72657475726E20743C303F653A652E6C656E6774683E743F652E';
wwv_flow_api.g_varchar2_table(4) := '737562737472696E6728302C742D33292B222E2E2E223A657D63617463682874297B72657475726E20657D7D28732C637C7C31352929292C73657454696D656F75742866756E6374696F6E28297B617065782E6D6573736167652E686964655061676553';
wwv_flow_api.g_varchar2_table(5) := '75636365737328297D2C7429297D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(6634387171623808042)
,p_plugin_id=>wwv_flow_api.id(6631450875265787206)
,p_file_name=>'script.min.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done