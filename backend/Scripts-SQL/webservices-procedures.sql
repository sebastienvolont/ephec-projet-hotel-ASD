CREATE PROCEDURE "DBA"."http_getCSS"(in url char(255))
BEGIN

  call sa_set_http_header('Content-Type', 'text/css');
  call sa_set_http_header('Access-Control-Allow-Origin', '*');
	select xp_read_file(dba.getPath() || 'CSS\' || url);
                      
END;
