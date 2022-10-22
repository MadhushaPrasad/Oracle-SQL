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
------------------------------------------------------------------------
-- insertion of xml data and Xml data type

CREATE TABLE adminUsers(
	id int NOT NULL PRIMARY KEY,
	xDoc Xml NOT NULL
);


INSERT INTO adminUsers VALUES(5,
	'<catalog>
		<product dept="WN">
			<number>555</number>
			<name language="en">Flece Pullover</name>
		</product>
		<doc>
			<title>hello</title>
		</doc>
	</catalog>');

SELECT * FROM adminUsers;

INSERT INTO adminUsers VALUES(3,
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
);

-------------------------------------------------------------------
-- path expression

-- Simple path descriptors are sequences of
-- tags separated by slashes (/).

-- If the descriptor begins with /, then the path
-- starts at the root and has those tags, in order.

-- If the descriptor begins with //, then the path
-- can start anywhere.

-- Value of a Path Descriptor

-- Each path descriptor, applied to a
-- document, has a value that is a sequence of
-- elements.

-- An element is an atomic value or a node.

-- A node is matching tags and everything in
-- between.


-- Example 01: /BARS/BAR/PRICE
<BARS>
    <BAR name = “JoesBar”>
            <PRICE theBeer = “Bud”>2.50</PRICE>
            <PRICE theBeer = “Miller”>3.00</PRICE>
    </BAR>
    <BEER name = “Bud” soldBy = “JoesBar SuesBar/>
</BARS>

    -- /BARS/BAR/PRICE describes the
    --     set with these two PRICE elements
    --     as well as the PRICE elements for
    --     any other bars.



-- Example 02: //PRICE
    <BARS>
        <BAR name = “JoesBar”>
            <PRICE theBeer = “Bud”>2.50</PRICE>
            <PRICE theBeer = “Miller”>3.00</PRICE>
        </BAR>
        <BEER name = “Bud” soldBy = “JoesBar SuesBar …”/>
    </BARS>

-- //PRICE describes the PRICE
-- Elements to appear within
-- the document.

-- Wild Card *

-- A star (*) in place of a tag represents any one
-- tag.

-- Example: /*/*/PRICE represents all price
-- objects at the third level of nesting.
-------------------------------------------------------------------------
-- Example 01: /BARS/*
    <BARS>
        <BAR name = “JoesBar”>
            <PRICE theBeer = “Bud”>2.50</PRICE>
            <PRICE theBeer = “Miller”>3.00</PRICE>
        </BAR>
        <BEER name = “Bud” soldBy = “JoesBar SuesBar”/>
    </BARS>

-- /BARS/* captures all BAR
-- and BEER elements, such
-- as these.

--------------------------------------------------------------------

-- 

-- In XPath, we refer to attributes by prepending ' @ ' to their

-- Attributes of a tag may appear in paths as if
-- they were nested within that tag.


-- Example: /BARS/*/@name
<BARS>
    <BAR name = “JoesBar”>
        <PRICE theBeer = “Bud”>2.50</PRICE>
        <PRICE theBeer = “Miller”>3.00</PRICE>
    </BAR>
    <BEER name = “Bud” soldBy = “JoesBar SuesBar”/>
</BARS>

-- /BARS/*/@name selects all
-- name attributes of immediate
-- subelements of the BARS element.

-------------------------------------------------------------------------------------------------

-- Axes

-- In general, path expressions allow us to
-- start at the root and execute steps to find a
-- sequence of nodes at each step.

-- At each step, we may follow any one of
-- several axes

/child::BAR[@name=“JoesBar"]

-- Axis -> child
-- Node test -> BAR
-- Predicate -> [@name=“JoesBar"]

-- 1.The axis (Optional)
--     -Direction to navigate
-- 2.The node test
--     -The node of interest by name
-- 3.Predicate
--     -The criteria used to filter nodes

    -- /BARS/BEER is really shorter way for
    -- /BARS/child::BEER

-- @ is really shorthand for the attribute:: axis.

    -- Thus, /BARS/BEER[@name = “Bud” ] is
    -- shorthand for
    -- /BARS/BEER[attribute::name = “Bud”]

-- More Axes

    -- Some other useful axes are:

        -- parent:: = parent(s) of the current node(s).

        -- descendant or self:: = the current node(s)
        -- and all descendants.
        -- Note: // is really shorthand for this axis.

        -- ancestor::, ancestor or self, etc.

        -- the default axis is child:: go to all the
        -- children of the current set of nodes.

-------------------------------------------------------------

-- Predicates

    -- A condition inside […] may follow a tag.

    -- If so, then only paths that have that tag and
    -- also satisfy the condition are included in the
    -- result of a path expression.

-- Example: /using Query() method

-- simple path expression
    SELECT id,xDoc.query('/catalog/product/'); -- -> gives all products
    SELECT id,xDoc.query('//product'); -- -> go to the root and give all products since down of root products are there

/*same code in the xql Database*/
SELECT id,xDoc.query('/*/doc[@id="123"]') FROM adminUsers;

SELECT id,xDoc.query('/*/child::doc[attribute::id="123"]') FROM adminUsers;

/*same code in the xql Database*/

SELECT id,xDoc.query('//doc[@id="123"]') FROM adminUsers;

SELECT id,xDoc.query('descendant-or-self::doc[attribute::id="123"]') FROM adminUsers;