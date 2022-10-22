-- start the document with a declation,srrounded by 
-- <?xml version="1.0" encoding="UTF-8"?>.this is the first line of the document.

-- tags are case sensitive

-- xml database have two types
--     Xml doc
--     Xml Schema

-- xml schema language check our document correct or NOT
-- it can be used to validate xml document

-- types of xml schema
-- DTD
-- XML Schema
-- Relax NG


/*CREATE TABLE adminUsers(
	id int NOT NULL PRIMARY KEY,
	xDoc Xml NOT NULL
);*/


/*INSERT INTO adminUsers VALUES(5,
	'<catalog>
		<product dept="WN">
			<number>555</number>
			<name language="en">Flece Pullover</name>
		</product>
		<doc>
			<title>hello</title>
		</doc>
	</catalog>
	');*/

	/*SELECT * FROM adminUsers;*/

/*INSERT INTO adminUsers VALUES(3,
	'
	<doc>
	<doc id="123">
		<section>
			<section num="1">
				<title>XML Schema</title>
			</section>
			<section num="2">
				<title>XML Schema</title>
			</section>
			<section num="3">
				<title>XML Schema</title>
			</section>
		</section>
	</doc>
	</doc>
	'
);*/


/*same code in the xql Database*/
SELECT id,xDoc.query('/*/doc[@id="123"]') FROM adminUsers;

SELECT id,xDoc.query('/*/child::doc[attribute::id="123"]') FROM adminUsers;

/*same code in the xql Database*/

SELECT id,xDoc.query('//doc[@id="123"]') FROM adminUsers;

SELECT id,xDoc.query('descendant-or-self::doc[attribute::id="123"]') FROM adminUsers;