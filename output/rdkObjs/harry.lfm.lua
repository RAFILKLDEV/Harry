require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_HarryFicha()
    local obj = GUI.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", rawget(obj, "setNodeObject"));

    function obj:setNodeObject(nodeObject)
        sheet = nodeObject;
        self.sheet = nodeObject;
        self:_oldSetNodeObjectFunction(nodeObject);
    end;

    function obj:setNodeDatabase(nodeObject)
        self:setNodeObject(nodeObject);
    end;

    _gui_assignInitialParentForForm(obj.handle);
    obj:beginUpdate();
    obj:setFormType("sheetTemplate");
    obj:setDataType("HarryPlugin");
    obj:setHeight(700);
    obj:setWidth(1080);
    obj:setTitle("Ficha Harry Potter Nova!");
    obj:setName("HarryFicha");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Jogador");
    obj.tab1:setName("tab1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.tab1);
    obj.rectangle1:setLeft(20);
    obj.rectangle1:setTop(20);
    obj.rectangle1:setWidth(200);
    obj.rectangle1:setHeight(200);
    obj.rectangle1:setName("rectangle1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.tab1);
    obj.image1:setField("imagemDoPersonagem");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setLeft(20);
    obj.image1:setTop(20);
    obj.image1:setWidth(200);
    obj.image1:setHeight(200);
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.tab1);
    obj.layout1:setLeft(20);
    obj.layout1:setTop(20);
    obj.layout1:setWidth(1300);
    obj.layout1:setHeight(1000);
    obj.layout1:setName("layout1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout1);
    obj.rectangle2:setLeft(220);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(700);
    obj.rectangle2:setHeight(155);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle2);
    obj.label1:setLeft(5);
    obj.label1:setTop(5);
    obj.label1:setText("Nome Jogador");
    obj.label1:setWidth(90);
    obj.label1:setHeight(25);
    obj.label1:setName("label1");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle2);
    obj.label3:setLeft(5);
    obj.label3:setTop(35);
    obj.label3:setText("Nome Personagem");
    obj.label3:setWidth(110);
    obj.label3:setHeight(25);
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle2);
    obj.label4:setLeft(5);
    obj.label4:setTop(65);
    obj.label4:setText("Cidade");
    obj.label4:setWidth(90);
    obj.label4:setHeight(25);
    obj.label4:setName("label4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle2);
    obj.label5:setLeft(5);
    obj.label5:setTop(95);
    obj.label5:setText("Continente");
    obj.label5:setWidth(90);
    obj.label5:setHeight(25);
    obj.label5:setName("label5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle2);
    obj.label6:setLeft(5);
    obj.label6:setTop(125);
    obj.label6:setText("Classe");
    obj.label6:setWidth(90);
    obj.label6:setHeight(25);
    obj.label6:setName("label6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle2);
    obj.label7:setLeft(130);
    obj.label7:setTop(125);
    obj.label7:setText("Level");
    obj.label7:setWidth(90);
    obj.label7:setHeight(25);
    obj.label7:setName("label7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle2);
    obj.label8:setLeft(222);
    obj.label8:setTop(125);
    obj.label8:setText("XP");
    obj.label8:setWidth(90);
    obj.label8:setHeight(25);
    obj.label8:setName("label8");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle2);
    obj.edit1:setLeft(100);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(245);
    obj.edit1:setHeight(25);
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle2);
    obj.edit2:setLeft(120);
    obj.edit2:setTop(35);
    obj.edit2:setWidth(225);
    obj.edit2:setHeight(25);
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle2);
    obj.edit3:setLeft(52);
    obj.edit3:setTop(65);
    obj.edit3:setWidth(293);
    obj.edit3:setHeight(25);
    obj.edit3:setName("edit3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle2);
    obj.edit4:setLeft(75);
    obj.edit4:setTop(95);
    obj.edit4:setWidth(270);
    obj.edit4:setHeight(25);
    obj.edit4:setName("edit4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle2);
    obj.edit5:setLeft(45);
    obj.edit5:setTop(125);
    obj.edit5:setWidth(80);
    obj.edit5:setHeight(25);
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle2);
    obj.edit6:setLeft(165);
    obj.edit6:setTop(125);
    obj.edit6:setWidth(50);
    obj.edit6:setHeight(25);
    obj.edit6:setName("edit6");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle2);
    obj.edit7:setLeft(245);
    obj.edit7:setTop(125);
    obj.edit7:setWidth(100);
    obj.edit7:setHeight(25);
    obj.edit7:setName("edit7");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(0);
    obj.layout2:setTop(220);
    obj.layout2:setWidth(300);
    obj.layout2:setHeight(500);
    obj.layout2:setName("layout2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(100);
    obj.layout3:setName("layout3");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout3);
    obj.rectangle3:setAlign("top");
    obj.rectangle3:setHeight(150);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setName("rectangle3");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle3);
    obj.label9:setText("AGILIDADE");
    obj.label9:setHeight(25);
    obj.label9:setAlign("top");
    obj.label9:setMargins({left=5,top=5});
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle3);
    obj.label10:setText("DESTREZA");
    obj.label10:setHeight(25);
    obj.label10:setAlign("top");
    obj.label10:setMargins({left=5,top=5});
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle3);
    obj.label11:setText("FORÇA");
    obj.label11:setHeight(25);
    obj.label11:setAlign("top");
    obj.label11:setMargins({left=5,top=5});
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle3);
    obj.label12:setText("LUTA");
    obj.label12:setHeight(25);
    obj.label12:setAlign("top");
    obj.label12:setMargins({left=5,top=5});
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle3);
    obj.label13:setText("VIGOR");
    obj.label13:setHeight(25);
    obj.label13:setAlign("top");
    obj.label13:setMargins({left=5,top=5});
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout3);
    obj.rectangle4:setMargins({top=20});
    obj.rectangle4:setAlign("top");
    obj.rectangle4:setHeight(90);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setName("rectangle4");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectangle4);
    obj.label14:setText("INTELIGENCIA");
    obj.label14:setHeight(25);
    obj.label14:setAlign("top");
    obj.label14:setMargins({left=5,top=5});
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.rectangle4);
    obj.label15:setText("PRESENÇA");
    obj.label15:setHeight(25);
    obj.label15:setAlign("top");
    obj.label15:setMargins({left=5,top=5});
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectangle4);
    obj.label16:setText("SABEDORIA");
    obj.label16:setHeight(25);
    obj.label16:setAlign("top");
    obj.label16:setMargins({left=5,top=5});
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout2);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(40);
    obj.layout4:setName("layout4");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout4);
    obj.rectangle5:setAlign("top");
    obj.rectangle5:setHeight(150);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setName("rectangle5");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle5);
    obj.edit8:setHeight(25);
    obj.edit8:setAlign("top");
    obj.edit8:setMargins({left=5,top=5});
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle5);
    obj.edit9:setHeight(25);
    obj.edit9:setAlign("top");
    obj.edit9:setMargins({left=5,top=5});
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setName("edit9");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle5);
    obj.edit10:setHeight(25);
    obj.edit10:setAlign("top");
    obj.edit10:setMargins({left=5,top=5});
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectangle5);
    obj.edit11:setHeight(25);
    obj.edit11:setAlign("top");
    obj.edit11:setMargins({left=5,top=5});
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setName("edit11");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.rectangle5);
    obj.edit12:setHeight(25);
    obj.edit12:setAlign("top");
    obj.edit12:setMargins({left=5,top=5});
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setName("edit12");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout4);
    obj.rectangle6:setMargins({top=20});
    obj.rectangle6:setAlign("top");
    obj.rectangle6:setHeight(90);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setName("rectangle6");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.rectangle6);
    obj.edit13:setHeight(25);
    obj.edit13:setAlign("top");
    obj.edit13:setMargins({left=5,top=5});
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setName("edit13");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.rectangle6);
    obj.edit14:setHeight(25);
    obj.edit14:setAlign("top");
    obj.edit14:setMargins({left=5,top=5});
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.rectangle6);
    obj.edit15:setHeight(25);
    obj.edit15:setAlign("top");
    obj.edit15:setMargins({left=5,top=5});
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setName("edit15");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout2);
    obj.layout5:setAlign("left");
    obj.layout5:setWidth(40);
    obj.layout5:setName("layout5");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout5);
    obj.rectangle7:setAlign("top");
    obj.rectangle7:setHeight(150);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setPadding({right=5});
    obj.rectangle7:setName("rectangle7");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.rectangle7);
    obj.edit16:setHeight(25);
    obj.edit16:setAlign("top");
    obj.edit16:setMargins({left=5,top=5});
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.rectangle7);
    obj.edit17:setHeight(25);
    obj.edit17:setAlign("top");
    obj.edit17:setMargins({left=5,top=5});
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.rectangle7);
    obj.edit18:setHeight(25);
    obj.edit18:setAlign("top");
    obj.edit18:setMargins({left=5,top=5});
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.rectangle7);
    obj.edit19:setHeight(25);
    obj.edit19:setAlign("top");
    obj.edit19:setMargins({left=5,top=5});
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setName("edit19");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.rectangle7);
    obj.edit20:setHeight(25);
    obj.edit20:setAlign("top");
    obj.edit20:setMargins({left=5,top=5});
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setName("edit20");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout5);
    obj.rectangle8:setMargins({top=20});
    obj.rectangle8:setAlign("top");
    obj.rectangle8:setHeight(90);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setPadding({right=5});
    obj.rectangle8:setName("rectangle8");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.rectangle8);
    obj.edit21:setHeight(25);
    obj.edit21:setAlign("top");
    obj.edit21:setMargins({left=5,top=5});
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setName("edit21");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.rectangle8);
    obj.edit22:setHeight(25);
    obj.edit22:setAlign("top");
    obj.edit22:setMargins({left=5,top=5});
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setName("edit22");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.rectangle8);
    obj.edit23:setHeight(25);
    obj.edit23:setAlign("top");
    obj.edit23:setMargins({left=5,top=5});
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setName("edit23");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.tab1);
    obj.layout6:setLeft(240);
    obj.layout6:setTop(200);
    obj.layout6:setWidth(1300);
    obj.layout6:setHeight(600);
    obj.layout6:setName("layout6");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout6);
    obj.layout7:setWidth(800);
    obj.layout7:setHeight(700);
    obj.layout7:setName("layout7");

    obj.tabControl2 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl2:setParent(obj.layout7);
    obj.tabControl2:setAlign("left");
    obj.tabControl2:setWidth(350);
    obj.tabControl2:setName("tabControl2");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl2);
    obj.tab2:setTitle("Corpo");
    obj.tab2:setWidth(134);
    obj.tab2:setName("tab2");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.tab2);
    obj.layout8:setHeight(250);
    obj.layout8:setAlign("top");
    obj.layout8:setName("layout8");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout8);
    obj.label17:setAlign("top");
    obj.label17:setHeight(50);
    obj.label17:setText("Corpo");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout8);
    obj.layout9:setHeight(30);
    obj.layout9:setAlign("top");
    obj.layout9:setMargins({top=3});
    obj.layout9:setName("layout9");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout9);
    obj.label18:setText("Acrobacia");
    obj.label18:setAlign("left");
    obj.label18:setWidth(120);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout9);
    obj.edit24:setField("");
    obj.edit24:setAlign("left");
    obj.edit24:setMargins({left = 5});
    obj.edit24:setWidth(30);
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setName("edit24");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout9);
    obj.edit25:setField("");
    obj.edit25:setAlign("left");
    obj.edit25:setMargins({left = 5});
    obj.edit25:setWidth(30);
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setName("edit25");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout9);
    obj.label19:setText("0");
    obj.label19:setAlign("left");
    obj.label19:setMargins({left = 5});
    obj.label19:setWidth(30);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout9);
    obj.label20:setText("0");
    obj.label20:setAlign("left");
    obj.label20:setMargins({left = 5});
    obj.label20:setWidth(30);
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout8);
    obj.layout10:setHeight(30);
    obj.layout10:setAlign("top");
    obj.layout10:setMargins({top=3});
    obj.layout10:setName("layout10");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout10);
    obj.label21:setText("Atlestismo");
    obj.label21:setAlign("left");
    obj.label21:setWidth(120);
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout10);
    obj.edit26:setField("");
    obj.edit26:setAlign("left");
    obj.edit26:setMargins({left = 5});
    obj.edit26:setWidth(30);
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setName("edit26");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout10);
    obj.edit27:setField("");
    obj.edit27:setAlign("left");
    obj.edit27:setMargins({left = 5});
    obj.edit27:setWidth(30);
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setName("edit27");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout10);
    obj.label22:setText("0");
    obj.label22:setAlign("left");
    obj.label22:setMargins({left = 5});
    obj.label22:setWidth(30);
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout10);
    obj.label23:setText("0");
    obj.label23:setAlign("left");
    obj.label23:setMargins({left = 5});
    obj.label23:setWidth(30);
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout8);
    obj.layout11:setHeight(30);
    obj.layout11:setAlign("top");
    obj.layout11:setMargins({top=3});
    obj.layout11:setName("layout11");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout11);
    obj.label24:setText("Corpo-a-Corpo");
    obj.label24:setAlign("left");
    obj.label24:setWidth(120);
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout11);
    obj.edit28:setField("");
    obj.edit28:setAlign("left");
    obj.edit28:setMargins({left = 5});
    obj.edit28:setWidth(30);
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setName("edit28");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout11);
    obj.edit29:setField("");
    obj.edit29:setAlign("left");
    obj.edit29:setMargins({left = 5});
    obj.edit29:setWidth(30);
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setName("edit29");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout11);
    obj.label25:setText("0");
    obj.label25:setAlign("left");
    obj.label25:setMargins({left = 5});
    obj.label25:setWidth(30);
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout11);
    obj.label26:setText("0");
    obj.label26:setAlign("left");
    obj.label26:setMargins({left = 5});
    obj.label26:setWidth(30);
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout8);
    obj.layout12:setHeight(30);
    obj.layout12:setAlign("top");
    obj.layout12:setMargins({top=3});
    obj.layout12:setName("layout12");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout12);
    obj.label27:setText("Especialidade");
    obj.label27:setAlign("left");
    obj.label27:setWidth(120);
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout12);
    obj.edit30:setField("");
    obj.edit30:setAlign("left");
    obj.edit30:setMargins({left = 5});
    obj.edit30:setWidth(30);
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setName("edit30");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout12);
    obj.edit31:setField("");
    obj.edit31:setAlign("left");
    obj.edit31:setMargins({left = 5});
    obj.edit31:setWidth(30);
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setName("edit31");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout12);
    obj.label28:setText("0");
    obj.label28:setAlign("left");
    obj.label28:setMargins({left = 5});
    obj.label28:setWidth(30);
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout12);
    obj.label29:setText("0");
    obj.label29:setAlign("left");
    obj.label29:setMargins({left = 5});
    obj.label29:setWidth(30);
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout8);
    obj.layout13:setHeight(30);
    obj.layout13:setAlign("top");
    obj.layout13:setMargins({top=3});
    obj.layout13:setName("layout13");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout13);
    obj.label30:setText("Furtividade");
    obj.label30:setAlign("left");
    obj.label30:setWidth(120);
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout13);
    obj.edit32:setField("");
    obj.edit32:setAlign("left");
    obj.edit32:setMargins({left = 5});
    obj.edit32:setWidth(30);
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setName("edit32");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout13);
    obj.edit33:setField("");
    obj.edit33:setAlign("left");
    obj.edit33:setMargins({left = 5});
    obj.edit33:setWidth(30);
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setName("edit33");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout13);
    obj.label31:setText("0");
    obj.label31:setAlign("left");
    obj.label31:setMargins({left = 5});
    obj.label31:setWidth(30);
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout13);
    obj.label32:setText("0");
    obj.label32:setAlign("left");
    obj.label32:setMargins({left = 5});
    obj.label32:setWidth(30);
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout8);
    obj.layout14:setHeight(30);
    obj.layout14:setAlign("top");
    obj.layout14:setMargins({top=3});
    obj.layout14:setName("layout14");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout14);
    obj.label33:setText("Veiculos Mágicos");
    obj.label33:setAlign("left");
    obj.label33:setWidth(120);
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout14);
    obj.edit34:setField("");
    obj.edit34:setAlign("left");
    obj.edit34:setMargins({left = 5});
    obj.edit34:setWidth(30);
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setName("edit34");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout14);
    obj.edit35:setField("");
    obj.edit35:setAlign("left");
    obj.edit35:setMargins({left = 5});
    obj.edit35:setWidth(30);
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setName("edit35");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout14);
    obj.label34:setText("0");
    obj.label34:setAlign("left");
    obj.label34:setMargins({left = 5});
    obj.label34:setWidth(30);
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout14);
    obj.label35:setText("0");
    obj.label35:setAlign("left");
    obj.label35:setMargins({left = 5});
    obj.label35:setWidth(30);
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl2);
    obj.tab3:setTitle("Mente");
    obj.tab3:setWidth(134);
    obj.tab3:setName("tab3");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.tab3);
    obj.layout15:setHeight(320);
    obj.layout15:setAlign("top");
    obj.layout15:setName("layout15");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout15);
    obj.label36:setAlign("top");
    obj.label36:setHeight(50);
    obj.label36:setText("Mente");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout15);
    obj.layout16:setHeight(30);
    obj.layout16:setAlign("top");
    obj.layout16:setMargins({top=3});
    obj.layout16:setName("layout16");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout16);
    obj.label37:setText("Enganação");
    obj.label37:setAlign("left");
    obj.label37:setWidth(120);
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout16);
    obj.edit36:setField("");
    obj.edit36:setAlign("left");
    obj.edit36:setMargins({left = 5});
    obj.edit36:setWidth(30);
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setName("edit36");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout16);
    obj.edit37:setField("");
    obj.edit37:setAlign("left");
    obj.edit37:setMargins({left = 5});
    obj.edit37:setWidth(30);
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setName("edit37");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout16);
    obj.label38:setText("0");
    obj.label38:setAlign("left");
    obj.label38:setMargins({left = 5});
    obj.label38:setWidth(30);
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout16);
    obj.label39:setText("0");
    obj.label39:setAlign("left");
    obj.label39:setMargins({left = 5});
    obj.label39:setWidth(30);
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout15);
    obj.layout17:setHeight(30);
    obj.layout17:setAlign("top");
    obj.layout17:setMargins({top=3});
    obj.layout17:setName("layout17");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout17);
    obj.label40:setText("Intimidação");
    obj.label40:setAlign("left");
    obj.label40:setWidth(120);
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout17);
    obj.edit38:setField("");
    obj.edit38:setAlign("left");
    obj.edit38:setMargins({left = 5});
    obj.edit38:setWidth(30);
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setName("edit38");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout17);
    obj.edit39:setField("");
    obj.edit39:setAlign("left");
    obj.edit39:setMargins({left = 5});
    obj.edit39:setWidth(30);
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setName("edit39");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout17);
    obj.label41:setText("0");
    obj.label41:setAlign("left");
    obj.label41:setMargins({left = 5});
    obj.label41:setWidth(30);
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout17);
    obj.label42:setText("0");
    obj.label42:setAlign("left");
    obj.label42:setMargins({left = 5});
    obj.label42:setWidth(30);
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout15);
    obj.layout18:setHeight(30);
    obj.layout18:setAlign("top");
    obj.layout18:setMargins({top=3});
    obj.layout18:setName("layout18");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout18);
    obj.label43:setText("Intuição");
    obj.label43:setAlign("left");
    obj.label43:setWidth(120);
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout18);
    obj.edit40:setField("");
    obj.edit40:setAlign("left");
    obj.edit40:setMargins({left = 5});
    obj.edit40:setWidth(30);
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setName("edit40");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout18);
    obj.edit41:setField("");
    obj.edit41:setAlign("left");
    obj.edit41:setMargins({left = 5});
    obj.edit41:setWidth(30);
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setName("edit41");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout18);
    obj.label44:setText("0");
    obj.label44:setAlign("left");
    obj.label44:setMargins({left = 5});
    obj.label44:setWidth(30);
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout18);
    obj.label45:setText("0");
    obj.label45:setAlign("left");
    obj.label45:setMargins({left = 5});
    obj.label45:setWidth(30);
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout15);
    obj.layout19:setHeight(30);
    obj.layout19:setAlign("top");
    obj.layout19:setMargins({top=3});
    obj.layout19:setName("layout19");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout19);
    obj.label46:setText("Percepção");
    obj.label46:setAlign("left");
    obj.label46:setWidth(120);
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout19);
    obj.edit42:setField("");
    obj.edit42:setAlign("left");
    obj.edit42:setMargins({left = 5});
    obj.edit42:setWidth(30);
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setName("edit42");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout19);
    obj.edit43:setField("");
    obj.edit43:setAlign("left");
    obj.edit43:setMargins({left = 5});
    obj.edit43:setWidth(30);
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setName("edit43");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout19);
    obj.label47:setText("0");
    obj.label47:setAlign("left");
    obj.label47:setMargins({left = 5});
    obj.label47:setWidth(30);
    obj.label47:setHorzTextAlign("center");
    obj.label47:setName("label47");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout19);
    obj.label48:setText("0");
    obj.label48:setAlign("left");
    obj.label48:setMargins({left = 5});
    obj.label48:setWidth(30);
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout15);
    obj.layout20:setHeight(30);
    obj.layout20:setAlign("top");
    obj.layout20:setMargins({top=3});
    obj.layout20:setName("layout20");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout20);
    obj.label49:setText("Persuação");
    obj.label49:setAlign("left");
    obj.label49:setWidth(120);
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout20);
    obj.edit44:setField("");
    obj.edit44:setAlign("left");
    obj.edit44:setMargins({left = 5});
    obj.edit44:setWidth(30);
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setName("edit44");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout20);
    obj.edit45:setField("");
    obj.edit45:setAlign("left");
    obj.edit45:setMargins({left = 5});
    obj.edit45:setWidth(30);
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setName("edit45");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout20);
    obj.label50:setText("0");
    obj.label50:setAlign("left");
    obj.label50:setMargins({left = 5});
    obj.label50:setWidth(30);
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout20);
    obj.label51:setText("0");
    obj.label51:setAlign("left");
    obj.label51:setMargins({left = 5});
    obj.label51:setWidth(30);
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout15);
    obj.layout21:setHeight(30);
    obj.layout21:setAlign("top");
    obj.layout21:setMargins({top=3});
    obj.layout21:setName("layout21");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout21);
    obj.label52:setText("Enganação");
    obj.label52:setAlign("left");
    obj.label52:setWidth(120);
    obj.label52:setHorzTextAlign("center");
    obj.label52:setName("label52");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout21);
    obj.edit46:setField("");
    obj.edit46:setAlign("left");
    obj.edit46:setMargins({left = 5});
    obj.edit46:setWidth(30);
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setName("edit46");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout21);
    obj.edit47:setField("");
    obj.edit47:setAlign("left");
    obj.edit47:setMargins({left = 5});
    obj.edit47:setWidth(30);
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setName("edit47");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout21);
    obj.label53:setText("0");
    obj.label53:setAlign("left");
    obj.label53:setMargins({left = 5});
    obj.label53:setWidth(30);
    obj.label53:setHorzTextAlign("center");
    obj.label53:setName("label53");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout21);
    obj.label54:setText("0");
    obj.label54:setAlign("left");
    obj.label54:setMargins({left = 5});
    obj.label54:setWidth(30);
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl2);
    obj.tab4:setTitle("Conhecimentos");
    obj.tab4:setWidth(134);
    obj.tab4:setName("tab4");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.tab4);
    obj.label55:setAlign("top");
    obj.label55:setHeight(50);
    obj.label55:setText("Conhecimentos");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.tab4);
    obj.layout22:setHeight(30);
    obj.layout22:setAlign("top");
    obj.layout22:setMargins({top=3});
    obj.layout22:setName("layout22");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout22);
    obj.label56:setText("Atualidades");
    obj.label56:setAlign("left");
    obj.label56:setWidth(200);
    obj.label56:setHorzTextAlign("center");
    obj.label56:setName("label56");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout22);
    obj.edit48:setField("");
    obj.edit48:setAlign("left");
    obj.edit48:setMargins({left = 5});
    obj.edit48:setWidth(30);
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setName("edit48");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout22);
    obj.edit49:setField("");
    obj.edit49:setAlign("left");
    obj.edit49:setMargins({left = 5});
    obj.edit49:setWidth(30);
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setName("edit49");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout22);
    obj.label57:setText("0");
    obj.label57:setAlign("left");
    obj.label57:setMargins({left = 5});
    obj.label57:setWidth(30);
    obj.label57:setHorzTextAlign("center");
    obj.label57:setName("label57");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout22);
    obj.label58:setText("0");
    obj.label58:setAlign("left");
    obj.label58:setMargins({left = 5});
    obj.label58:setWidth(30);
    obj.label58:setHorzTextAlign("center");
    obj.label58:setName("label58");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.tab4);
    obj.layout23:setHeight(30);
    obj.layout23:setAlign("top");
    obj.layout23:setMargins({top=3});
    obj.layout23:setName("layout23");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout23);
    obj.label59:setText("Conhe. Adivinhação");
    obj.label59:setAlign("left");
    obj.label59:setWidth(200);
    obj.label59:setHorzTextAlign("center");
    obj.label59:setName("label59");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout23);
    obj.edit50:setField("");
    obj.edit50:setAlign("left");
    obj.edit50:setMargins({left = 5});
    obj.edit50:setWidth(30);
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setName("edit50");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout23);
    obj.edit51:setField("");
    obj.edit51:setAlign("left");
    obj.edit51:setMargins({left = 5});
    obj.edit51:setWidth(30);
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setName("edit51");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout23);
    obj.label60:setText("0");
    obj.label60:setAlign("left");
    obj.label60:setMargins({left = 5});
    obj.label60:setWidth(30);
    obj.label60:setHorzTextAlign("center");
    obj.label60:setName("label60");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout23);
    obj.label61:setText("0");
    obj.label61:setAlign("left");
    obj.label61:setMargins({left = 5});
    obj.label61:setWidth(30);
    obj.label61:setHorzTextAlign("center");
    obj.label61:setName("label61");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.tab4);
    obj.layout24:setHeight(30);
    obj.layout24:setAlign("top");
    obj.layout24:setMargins({top=3});
    obj.layout24:setName("layout24");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout24);
    obj.label62:setText("Conhe. Azaração");
    obj.label62:setAlign("left");
    obj.label62:setWidth(200);
    obj.label62:setHorzTextAlign("center");
    obj.label62:setName("label62");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout24);
    obj.edit52:setField("");
    obj.edit52:setAlign("left");
    obj.edit52:setMargins({left = 5});
    obj.edit52:setWidth(30);
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setName("edit52");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout24);
    obj.edit53:setField("");
    obj.edit53:setAlign("left");
    obj.edit53:setMargins({left = 5});
    obj.edit53:setWidth(30);
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setName("edit53");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout24);
    obj.label63:setText("0");
    obj.label63:setAlign("left");
    obj.label63:setMargins({left = 5});
    obj.label63:setWidth(30);
    obj.label63:setHorzTextAlign("center");
    obj.label63:setName("label63");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout24);
    obj.label64:setText("0");
    obj.label64:setAlign("left");
    obj.label64:setMargins({left = 5});
    obj.label64:setWidth(30);
    obj.label64:setHorzTextAlign("center");
    obj.label64:setName("label64");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.tab4);
    obj.layout25:setHeight(30);
    obj.layout25:setAlign("top");
    obj.layout25:setMargins({top=3});
    obj.layout25:setName("layout25");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout25);
    obj.label65:setText("Conhe. Contra-Feitiço");
    obj.label65:setAlign("left");
    obj.label65:setWidth(200);
    obj.label65:setHorzTextAlign("center");
    obj.label65:setName("label65");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout25);
    obj.edit54:setField("");
    obj.edit54:setAlign("left");
    obj.edit54:setMargins({left = 5});
    obj.edit54:setWidth(30);
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setName("edit54");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout25);
    obj.edit55:setField("");
    obj.edit55:setAlign("left");
    obj.edit55:setMargins({left = 5});
    obj.edit55:setWidth(30);
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setName("edit55");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout25);
    obj.label66:setText("0");
    obj.label66:setAlign("left");
    obj.label66:setMargins({left = 5});
    obj.label66:setWidth(30);
    obj.label66:setHorzTextAlign("center");
    obj.label66:setName("label66");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout25);
    obj.label67:setText("0");
    obj.label67:setAlign("left");
    obj.label67:setMargins({left = 5});
    obj.label67:setWidth(30);
    obj.label67:setHorzTextAlign("center");
    obj.label67:setName("label67");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.tab4);
    obj.layout26:setHeight(30);
    obj.layout26:setAlign("top");
    obj.layout26:setMargins({top=3});
    obj.layout26:setName("layout26");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout26);
    obj.label68:setText("Conhe. Criaturas Mágicas");
    obj.label68:setAlign("left");
    obj.label68:setWidth(200);
    obj.label68:setHorzTextAlign("center");
    obj.label68:setName("label68");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout26);
    obj.edit56:setField("");
    obj.edit56:setAlign("left");
    obj.edit56:setMargins({left = 5});
    obj.edit56:setWidth(30);
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setName("edit56");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout26);
    obj.edit57:setField("");
    obj.edit57:setAlign("left");
    obj.edit57:setMargins({left = 5});
    obj.edit57:setWidth(30);
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setName("edit57");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout26);
    obj.label69:setText("0");
    obj.label69:setAlign("left");
    obj.label69:setMargins({left = 5});
    obj.label69:setWidth(30);
    obj.label69:setHorzTextAlign("center");
    obj.label69:setName("label69");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout26);
    obj.label70:setText("0");
    obj.label70:setAlign("left");
    obj.label70:setMargins({left = 5});
    obj.label70:setWidth(30);
    obj.label70:setHorzTextAlign("center");
    obj.label70:setName("label70");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.tab4);
    obj.layout27:setHeight(30);
    obj.layout27:setAlign("top");
    obj.layout27:setMargins({top=3});
    obj.layout27:setName("layout27");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout27);
    obj.label71:setText("Conhe. Encantamentos");
    obj.label71:setAlign("left");
    obj.label71:setWidth(200);
    obj.label71:setHorzTextAlign("center");
    obj.label71:setName("label71");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout27);
    obj.edit58:setField("");
    obj.edit58:setAlign("left");
    obj.edit58:setMargins({left = 5});
    obj.edit58:setWidth(30);
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setName("edit58");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout27);
    obj.edit59:setField("");
    obj.edit59:setAlign("left");
    obj.edit59:setMargins({left = 5});
    obj.edit59:setWidth(30);
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setName("edit59");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout27);
    obj.label72:setText("0");
    obj.label72:setAlign("left");
    obj.label72:setMargins({left = 5});
    obj.label72:setWidth(30);
    obj.label72:setHorzTextAlign("center");
    obj.label72:setName("label72");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout27);
    obj.label73:setText("0");
    obj.label73:setAlign("left");
    obj.label73:setMargins({left = 5});
    obj.label73:setWidth(30);
    obj.label73:setHorzTextAlign("center");
    obj.label73:setName("label73");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.tab4);
    obj.layout28:setHeight(30);
    obj.layout28:setAlign("top");
    obj.layout28:setMargins({top=3});
    obj.layout28:setName("layout28");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout28);
    obj.label74:setText("Conhe. Feitiços");
    obj.label74:setAlign("left");
    obj.label74:setWidth(200);
    obj.label74:setHorzTextAlign("center");
    obj.label74:setName("label74");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout28);
    obj.edit60:setField("");
    obj.edit60:setAlign("left");
    obj.edit60:setMargins({left = 5});
    obj.edit60:setWidth(30);
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setName("edit60");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout28);
    obj.edit61:setField("");
    obj.edit61:setAlign("left");
    obj.edit61:setMargins({left = 5});
    obj.edit61:setWidth(30);
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setName("edit61");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout28);
    obj.label75:setText("0");
    obj.label75:setAlign("left");
    obj.label75:setMargins({left = 5});
    obj.label75:setWidth(30);
    obj.label75:setHorzTextAlign("center");
    obj.label75:setName("label75");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout28);
    obj.label76:setText("0");
    obj.label76:setAlign("left");
    obj.label76:setMargins({left = 5});
    obj.label76:setWidth(30);
    obj.label76:setHorzTextAlign("center");
    obj.label76:setName("label76");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.tab4);
    obj.layout29:setHeight(30);
    obj.layout29:setAlign("top");
    obj.layout29:setMargins({top=3});
    obj.layout29:setName("layout29");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout29);
    obj.label77:setText("Conhe. Herbologia");
    obj.label77:setAlign("left");
    obj.label77:setWidth(200);
    obj.label77:setHorzTextAlign("center");
    obj.label77:setName("label77");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout29);
    obj.edit62:setField("");
    obj.edit62:setAlign("left");
    obj.edit62:setMargins({left = 5});
    obj.edit62:setWidth(30);
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setName("edit62");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout29);
    obj.edit63:setField("");
    obj.edit63:setAlign("left");
    obj.edit63:setMargins({left = 5});
    obj.edit63:setWidth(30);
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setName("edit63");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout29);
    obj.label78:setText("0");
    obj.label78:setAlign("left");
    obj.label78:setMargins({left = 5});
    obj.label78:setWidth(30);
    obj.label78:setHorzTextAlign("center");
    obj.label78:setName("label78");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout29);
    obj.label79:setText("0");
    obj.label79:setAlign("left");
    obj.label79:setMargins({left = 5});
    obj.label79:setWidth(30);
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.tab4);
    obj.layout30:setHeight(30);
    obj.layout30:setAlign("top");
    obj.layout30:setMargins({top=3});
    obj.layout30:setName("layout30");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout30);
    obj.label80:setText("Conhe. Maldições (DCAT)");
    obj.label80:setAlign("left");
    obj.label80:setWidth(200);
    obj.label80:setHorzTextAlign("center");
    obj.label80:setName("label80");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout30);
    obj.edit64:setField("");
    obj.edit64:setAlign("left");
    obj.edit64:setMargins({left = 5});
    obj.edit64:setWidth(30);
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setName("edit64");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout30);
    obj.edit65:setField("");
    obj.edit65:setAlign("left");
    obj.edit65:setMargins({left = 5});
    obj.edit65:setWidth(30);
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setName("edit65");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout30);
    obj.label81:setText("0");
    obj.label81:setAlign("left");
    obj.label81:setMargins({left = 5});
    obj.label81:setWidth(30);
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout30);
    obj.label82:setText("0");
    obj.label82:setAlign("left");
    obj.label82:setMargins({left = 5});
    obj.label82:setWidth(30);
    obj.label82:setHorzTextAlign("center");
    obj.label82:setName("label82");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.tab4);
    obj.layout31:setHeight(30);
    obj.layout31:setAlign("top");
    obj.layout31:setMargins({top=3});
    obj.layout31:setName("layout31");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout31);
    obj.label83:setText("Conhe. Poções");
    obj.label83:setAlign("left");
    obj.label83:setWidth(200);
    obj.label83:setHorzTextAlign("center");
    obj.label83:setName("label83");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout31);
    obj.edit66:setField("");
    obj.edit66:setAlign("left");
    obj.edit66:setMargins({left = 5});
    obj.edit66:setWidth(30);
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setName("edit66");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout31);
    obj.edit67:setField("");
    obj.edit67:setAlign("left");
    obj.edit67:setMargins({left = 5});
    obj.edit67:setWidth(30);
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setName("edit67");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout31);
    obj.label84:setText("0");
    obj.label84:setAlign("left");
    obj.label84:setMargins({left = 5});
    obj.label84:setWidth(30);
    obj.label84:setHorzTextAlign("center");
    obj.label84:setName("label84");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout31);
    obj.label85:setText("0");
    obj.label85:setAlign("left");
    obj.label85:setMargins({left = 5});
    obj.label85:setWidth(30);
    obj.label85:setHorzTextAlign("center");
    obj.label85:setName("label85");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.tab4);
    obj.layout32:setHeight(30);
    obj.layout32:setAlign("top");
    obj.layout32:setMargins({top=3});
    obj.layout32:setName("layout32");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout32);
    obj.label86:setText("Conhe. Runas");
    obj.label86:setAlign("left");
    obj.label86:setWidth(200);
    obj.label86:setHorzTextAlign("center");
    obj.label86:setName("label86");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout32);
    obj.edit68:setField("");
    obj.edit68:setAlign("left");
    obj.edit68:setMargins({left = 5});
    obj.edit68:setWidth(30);
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setName("edit68");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout32);
    obj.edit69:setField("");
    obj.edit69:setAlign("left");
    obj.edit69:setMargins({left = 5});
    obj.edit69:setWidth(30);
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setName("edit69");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout32);
    obj.label87:setText("0");
    obj.label87:setAlign("left");
    obj.label87:setMargins({left = 5});
    obj.label87:setWidth(30);
    obj.label87:setHorzTextAlign("center");
    obj.label87:setName("label87");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout32);
    obj.label88:setText("0");
    obj.label88:setAlign("left");
    obj.label88:setMargins({left = 5});
    obj.label88:setWidth(30);
    obj.label88:setHorzTextAlign("center");
    obj.label88:setName("label88");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.tab4);
    obj.layout33:setHeight(30);
    obj.layout33:setAlign("top");
    obj.layout33:setMargins({top=3});
    obj.layout33:setName("layout33");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout33);
    obj.label89:setText("Conhe. Transmutação");
    obj.label89:setAlign("left");
    obj.label89:setWidth(200);
    obj.label89:setHorzTextAlign("center");
    obj.label89:setName("label89");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout33);
    obj.edit70:setField("");
    obj.edit70:setAlign("left");
    obj.edit70:setMargins({left = 5});
    obj.edit70:setWidth(30);
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setName("edit70");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout33);
    obj.edit71:setField("");
    obj.edit71:setAlign("left");
    obj.edit71:setMargins({left = 5});
    obj.edit71:setWidth(30);
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setName("edit71");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout33);
    obj.label90:setText("0");
    obj.label90:setAlign("left");
    obj.label90:setMargins({left = 5});
    obj.label90:setWidth(30);
    obj.label90:setHorzTextAlign("center");
    obj.label90:setName("label90");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout33);
    obj.label91:setText("0");
    obj.label91:setAlign("left");
    obj.label91:setMargins({left = 5});
    obj.label91:setWidth(30);
    obj.label91:setHorzTextAlign("center");
    obj.label91:setName("label91");

    obj.tabControl3 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl3:setParent(obj.layout7);
    obj.tabControl3:setAlign("left");
    obj.tabControl3:setWidth(300);
    obj.tabControl3:setName("tabControl3");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl3);
    obj.tab5:setTitle("Defesas");
    obj.tab5:setWidth(220);
    obj.tab5:setName("tab5");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.tab5);
    obj.label92:setAlign("top");
    obj.label92:setHeight(50);
    obj.label92:setText("Defesas Ativas");
    obj.label92:setHorzTextAlign("center");
    obj.label92:setName("label92");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.tab5);
    obj.layout34:setHeight(30);
    obj.layout34:setAlign("top");
    obj.layout34:setMargins({top=3});
    obj.layout34:setName("layout34");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout34);
    obj.label93:setText("Iniciativa");
    obj.label93:setAlign("left");
    obj.label93:setWidth(120);
    obj.label93:setHorzTextAlign("center");
    obj.label93:setName("label93");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout34);
    obj.edit72:setField("");
    obj.edit72:setAlign("left");
    obj.edit72:setMargins({left = 5});
    obj.edit72:setWidth(30);
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setName("edit72");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout34);
    obj.edit73:setField("");
    obj.edit73:setAlign("left");
    obj.edit73:setMargins({left = 5});
    obj.edit73:setWidth(30);
    obj.edit73:setHorzTextAlign("center");
    obj.edit73:setName("edit73");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout34);
    obj.label94:setText("0");
    obj.label94:setAlign("left");
    obj.label94:setMargins({left = 5});
    obj.label94:setWidth(30);
    obj.label94:setHorzTextAlign("center");
    obj.label94:setName("label94");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout34);
    obj.label95:setText("0");
    obj.label95:setAlign("left");
    obj.label95:setMargins({left = 5});
    obj.label95:setWidth(30);
    obj.label95:setHorzTextAlign("center");
    obj.label95:setName("label95");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.tab5);
    obj.layout35:setHeight(30);
    obj.layout35:setAlign("top");
    obj.layout35:setMargins({top=3});
    obj.layout35:setName("layout35");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout35);
    obj.label96:setText("Aparar");
    obj.label96:setAlign("left");
    obj.label96:setWidth(120);
    obj.label96:setHorzTextAlign("center");
    obj.label96:setName("label96");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout35);
    obj.edit74:setField("");
    obj.edit74:setAlign("left");
    obj.edit74:setMargins({left = 5});
    obj.edit74:setWidth(30);
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setName("edit74");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout35);
    obj.edit75:setField("");
    obj.edit75:setAlign("left");
    obj.edit75:setMargins({left = 5});
    obj.edit75:setWidth(30);
    obj.edit75:setHorzTextAlign("center");
    obj.edit75:setName("edit75");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout35);
    obj.label97:setText("0");
    obj.label97:setAlign("left");
    obj.label97:setMargins({left = 5});
    obj.label97:setWidth(30);
    obj.label97:setHorzTextAlign("center");
    obj.label97:setName("label97");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout35);
    obj.label98:setText("0");
    obj.label98:setAlign("left");
    obj.label98:setMargins({left = 5});
    obj.label98:setWidth(30);
    obj.label98:setHorzTextAlign("center");
    obj.label98:setName("label98");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.tab5);
    obj.layout36:setHeight(30);
    obj.layout36:setAlign("top");
    obj.layout36:setMargins({top=3});
    obj.layout36:setName("layout36");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout36);
    obj.label99:setText("Fortitude");
    obj.label99:setAlign("left");
    obj.label99:setWidth(120);
    obj.label99:setHorzTextAlign("center");
    obj.label99:setName("label99");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout36);
    obj.edit76:setField("");
    obj.edit76:setAlign("left");
    obj.edit76:setMargins({left = 5});
    obj.edit76:setWidth(30);
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setName("edit76");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout36);
    obj.edit77:setField("");
    obj.edit77:setAlign("left");
    obj.edit77:setMargins({left = 5});
    obj.edit77:setWidth(30);
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setName("edit77");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout36);
    obj.label100:setText("0");
    obj.label100:setAlign("left");
    obj.label100:setMargins({left = 5});
    obj.label100:setWidth(30);
    obj.label100:setHorzTextAlign("center");
    obj.label100:setName("label100");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout36);
    obj.label101:setText("0");
    obj.label101:setAlign("left");
    obj.label101:setMargins({left = 5});
    obj.label101:setWidth(30);
    obj.label101:setHorzTextAlign("center");
    obj.label101:setName("label101");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.tab5);
    obj.layout37:setHeight(30);
    obj.layout37:setAlign("top");
    obj.layout37:setMargins({top=3});
    obj.layout37:setName("layout37");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout37);
    obj.label102:setText("Reflexos");
    obj.label102:setAlign("left");
    obj.label102:setWidth(120);
    obj.label102:setHorzTextAlign("center");
    obj.label102:setName("label102");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout37);
    obj.edit78:setField("");
    obj.edit78:setAlign("left");
    obj.edit78:setMargins({left = 5});
    obj.edit78:setWidth(30);
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setName("edit78");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout37);
    obj.edit79:setField("");
    obj.edit79:setAlign("left");
    obj.edit79:setMargins({left = 5});
    obj.edit79:setWidth(30);
    obj.edit79:setHorzTextAlign("center");
    obj.edit79:setName("edit79");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout37);
    obj.label103:setText("0");
    obj.label103:setAlign("left");
    obj.label103:setMargins({left = 5});
    obj.label103:setWidth(30);
    obj.label103:setHorzTextAlign("center");
    obj.label103:setName("label103");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout37);
    obj.label104:setText("0");
    obj.label104:setAlign("left");
    obj.label104:setMargins({left = 5});
    obj.label104:setWidth(30);
    obj.label104:setHorzTextAlign("center");
    obj.label104:setName("label104");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.tab5);
    obj.layout38:setHeight(30);
    obj.layout38:setAlign("top");
    obj.layout38:setMargins({top=3});
    obj.layout38:setName("layout38");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout38);
    obj.label105:setText("Resistencia");
    obj.label105:setAlign("left");
    obj.label105:setWidth(120);
    obj.label105:setHorzTextAlign("center");
    obj.label105:setName("label105");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout38);
    obj.edit80:setField("");
    obj.edit80:setAlign("left");
    obj.edit80:setMargins({left = 5});
    obj.edit80:setWidth(30);
    obj.edit80:setHorzTextAlign("center");
    obj.edit80:setName("edit80");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout38);
    obj.edit81:setField("");
    obj.edit81:setAlign("left");
    obj.edit81:setMargins({left = 5});
    obj.edit81:setWidth(30);
    obj.edit81:setHorzTextAlign("center");
    obj.edit81:setName("edit81");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout38);
    obj.label106:setText("0");
    obj.label106:setAlign("left");
    obj.label106:setMargins({left = 5});
    obj.label106:setWidth(30);
    obj.label106:setHorzTextAlign("center");
    obj.label106:setName("label106");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout38);
    obj.label107:setText("0");
    obj.label107:setAlign("left");
    obj.label107:setMargins({left = 5});
    obj.label107:setWidth(30);
    obj.label107:setHorzTextAlign("center");
    obj.label107:setName("label107");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.tab5);
    obj.layout39:setHeight(30);
    obj.layout39:setAlign("top");
    obj.layout39:setMargins({top=3});
    obj.layout39:setName("layout39");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout39);
    obj.label108:setText("Vontade");
    obj.label108:setAlign("left");
    obj.label108:setWidth(120);
    obj.label108:setHorzTextAlign("center");
    obj.label108:setName("label108");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout39);
    obj.edit82:setField("");
    obj.edit82:setAlign("left");
    obj.edit82:setMargins({left = 5});
    obj.edit82:setWidth(30);
    obj.edit82:setHorzTextAlign("center");
    obj.edit82:setName("edit82");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout39);
    obj.edit83:setField("");
    obj.edit83:setAlign("left");
    obj.edit83:setMargins({left = 5});
    obj.edit83:setWidth(30);
    obj.edit83:setHorzTextAlign("center");
    obj.edit83:setName("edit83");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout39);
    obj.label109:setText("0");
    obj.label109:setAlign("left");
    obj.label109:setMargins({left = 5});
    obj.label109:setWidth(30);
    obj.label109:setHorzTextAlign("center");
    obj.label109:setName("label109");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout39);
    obj.label110:setText("0");
    obj.label110:setAlign("left");
    obj.label110:setMargins({left = 5});
    obj.label110:setWidth(30);
    obj.label110:setHorzTextAlign("center");
    obj.label110:setName("label110");

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Feitiços");
    obj.tab6:setName("tab6");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.tab6);
    obj.image2:setStyle("autoFit");
    obj.image2:setTop(0);
    obj.image2:setWidth(1300);
    obj.image2:setHeight(800);
    obj.image2:setSRC("/imagens/wizard.jpg");
    obj.image2:setName("image2");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.tab6);
    obj.layout40:setAlign("top");
    obj.layout40:setHeight(100);
    obj.layout40:setPadding({top=5, left=5});
    obj.layout40:setName("layout40");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout40);
    obj.layout41:setAlign("top");
    obj.layout41:setHeight(80);
    obj.layout41:setMargins({top=10, left=0});
    obj.layout41:setName("layout41");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout41);
    obj.layout42:setAlign("left");
    obj.layout42:setMargins({left=20});
    obj.layout42:setWidth(120);
    obj.layout42:setHeight(80);
    obj.layout42:setName("layout42");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout42);
    obj.rectangle9:setTop(5);
    obj.rectangle9:setLeft(10);
    obj.rectangle9:setColor("DarkSlateBlue");
    obj.rectangle9:setWidth(90);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setName("rectangle9");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.rectangle9);
    obj.label111:setAlign("client");
    obj.label111:setText("Destreza");
    obj.label111:setHorzTextAlign("center");
    obj.label111:setName("label111");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout42);
    obj.edit84:setTop(30);
    obj.edit84:setWidth(120);
    obj.edit84:setField("DES");
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setName("edit84");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout41);
    obj.layout43:setAlign("left");
    obj.layout43:setMargins({left=20});
    obj.layout43:setWidth(120);
    obj.layout43:setHeight(80);
    obj.layout43:setName("layout43");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout43);
    obj.rectangle10:setTop(5);
    obj.rectangle10:setLeft(10);
    obj.rectangle10:setColor("DarkSlateBlue");
    obj.rectangle10:setWidth(90);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setName("rectangle10");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.rectangle10);
    obj.label112:setAlign("client");
    obj.label112:setText("Adivinhação");
    obj.label112:setHorzTextAlign("center");
    obj.label112:setName("label112");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout43);
    obj.edit85:setTop(30);
    obj.edit85:setWidth(120);
    obj.edit85:setField("adivinhacao");
    obj.edit85:setHorzTextAlign("center");
    obj.edit85:setName("edit85");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout41);
    obj.layout44:setAlign("left");
    obj.layout44:setMargins({left=20});
    obj.layout44:setWidth(120);
    obj.layout44:setHeight(80);
    obj.layout44:setName("layout44");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout44);
    obj.rectangle11:setTop(5);
    obj.rectangle11:setLeft(10);
    obj.rectangle11:setColor("DarkSlateBlue");
    obj.rectangle11:setWidth(90);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setName("rectangle11");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.rectangle11);
    obj.label113:setAlign("client");
    obj.label113:setText("Azaração");
    obj.label113:setHorzTextAlign("center");
    obj.label113:setName("label113");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout44);
    obj.edit86:setTop(30);
    obj.edit86:setWidth(120);
    obj.edit86:setField("azaracao");
    obj.edit86:setHorzTextAlign("center");
    obj.edit86:setName("edit86");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout41);
    obj.layout45:setAlign("left");
    obj.layout45:setMargins({left=20});
    obj.layout45:setWidth(120);
    obj.layout45:setHeight(80);
    obj.layout45:setName("layout45");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout45);
    obj.rectangle12:setTop(5);
    obj.rectangle12:setLeft(10);
    obj.rectangle12:setColor("DarkSlateBlue");
    obj.rectangle12:setWidth(90);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setName("rectangle12");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.rectangle12);
    obj.label114:setAlign("client");
    obj.label114:setText("Contra-Feitiço");
    obj.label114:setHorzTextAlign("center");
    obj.label114:setName("label114");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout45);
    obj.edit87:setTop(30);
    obj.edit87:setWidth(120);
    obj.edit87:setField("contraFeitico");
    obj.edit87:setHorzTextAlign("center");
    obj.edit87:setName("edit87");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout41);
    obj.layout46:setAlign("left");
    obj.layout46:setMargins({left=20});
    obj.layout46:setWidth(120);
    obj.layout46:setHeight(80);
    obj.layout46:setName("layout46");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout46);
    obj.rectangle13:setTop(5);
    obj.rectangle13:setLeft(10);
    obj.rectangle13:setColor("DarkSlateBlue");
    obj.rectangle13:setWidth(90);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setName("rectangle13");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.rectangle13);
    obj.label115:setAlign("client");
    obj.label115:setText("Encantamento");
    obj.label115:setHorzTextAlign("center");
    obj.label115:setName("label115");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout46);
    obj.edit88:setTop(30);
    obj.edit88:setWidth(120);
    obj.edit88:setField("encantamento");
    obj.edit88:setHorzTextAlign("center");
    obj.edit88:setName("edit88");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout41);
    obj.layout47:setAlign("left");
    obj.layout47:setMargins({left=20});
    obj.layout47:setWidth(120);
    obj.layout47:setHeight(80);
    obj.layout47:setName("layout47");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout47);
    obj.rectangle14:setTop(5);
    obj.rectangle14:setLeft(10);
    obj.rectangle14:setColor("DarkSlateBlue");
    obj.rectangle14:setWidth(90);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setName("rectangle14");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.rectangle14);
    obj.label116:setAlign("client");
    obj.label116:setText("Feitiço");
    obj.label116:setHorzTextAlign("center");
    obj.label116:setName("label116");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout47);
    obj.edit89:setTop(30);
    obj.edit89:setWidth(120);
    obj.edit89:setField("feitico");
    obj.edit89:setHorzTextAlign("center");
    obj.edit89:setName("edit89");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout41);
    obj.layout48:setAlign("left");
    obj.layout48:setMargins({left=20});
    obj.layout48:setWidth(120);
    obj.layout48:setHeight(80);
    obj.layout48:setName("layout48");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout48);
    obj.rectangle15:setTop(5);
    obj.rectangle15:setLeft(10);
    obj.rectangle15:setColor("DarkSlateBlue");
    obj.rectangle15:setWidth(90);
    obj.rectangle15:setHeight(25);
    obj.rectangle15:setName("rectangle15");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.rectangle15);
    obj.label117:setAlign("client");
    obj.label117:setText("Transmutação");
    obj.label117:setHorzTextAlign("center");
    obj.label117:setName("label117");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout48);
    obj.edit90:setTop(30);
    obj.edit90:setWidth(120);
    obj.edit90:setField("transmutacao");
    obj.edit90:setHorzTextAlign("center");
    obj.edit90:setName("edit90");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout41);
    obj.layout49:setAlign("left");
    obj.layout49:setMargins({left=20});
    obj.layout49:setWidth(120);
    obj.layout49:setHeight(80);
    obj.layout49:setName("layout49");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout49);
    obj.rectangle16:setTop(5);
    obj.rectangle16:setLeft(10);
    obj.rectangle16:setColor("DarkSlateBlue");
    obj.rectangle16:setWidth(90);
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setName("rectangle16");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.rectangle16);
    obj.label118:setAlign("client");
    obj.label118:setText("Arte das Trevas");
    obj.label118:setHorzTextAlign("center");
    obj.label118:setName("label118");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout49);
    obj.edit91:setTop(30);
    obj.edit91:setWidth(120);
    obj.edit91:setField("arteDasTrevas");
    obj.edit91:setHorzTextAlign("center");
    obj.edit91:setName("edit91");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.tab6);
    obj.layout50:setAlign("top");
    obj.layout50:setHeight(80);
    obj.layout50:setMargins({top=0, left=0});
    obj.layout50:setName("layout50");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout50);
    obj.layout51:setAlign("left");
    obj.layout51:setMargins({left=20});
    obj.layout51:setWidth(120);
    obj.layout51:setHeight(80);
    obj.layout51:setName("layout51");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout51);
    obj.rectangle17:setTop(5);
    obj.rectangle17:setLeft(10);
    obj.rectangle17:setColor("#6B8E23");
    obj.rectangle17:setWidth(90);
    obj.rectangle17:setHeight(25);
    obj.rectangle17:setName("rectangle17");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.rectangle17);
    obj.label119:setAlign("client");
    obj.label119:setText("Fisico");
    obj.label119:setHorzTextAlign("center");
    obj.label119:setName("label119");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout51);
    obj.edit92:setTop(30);
    obj.edit92:setWidth(120);
    obj.edit92:setField("fisico");
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setName("edit92");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout50);
    obj.layout52:setAlign("left");
    obj.layout52:setMargins({left=20});
    obj.layout52:setWidth(120);
    obj.layout52:setHeight(80);
    obj.layout52:setName("layout52");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout52);
    obj.rectangle18:setTop(5);
    obj.rectangle18:setLeft(10);
    obj.rectangle18:setColor("#6B8E23");
    obj.rectangle18:setWidth(90);
    obj.rectangle18:setHeight(25);
    obj.rectangle18:setName("rectangle18");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.rectangle18);
    obj.label120:setAlign("client");
    obj.label120:setText("Mental");
    obj.label120:setHorzTextAlign("center");
    obj.label120:setName("label120");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout52);
    obj.edit93:setTop(30);
    obj.edit93:setWidth(120);
    obj.edit93:setField("mental");
    obj.edit93:setHorzTextAlign("center");
    obj.edit93:setName("edit93");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout50);
    obj.layout53:setAlign("left");
    obj.layout53:setMargins({left=20});
    obj.layout53:setWidth(120);
    obj.layout53:setHeight(80);
    obj.layout53:setName("layout53");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout53);
    obj.rectangle19:setTop(5);
    obj.rectangle19:setLeft(10);
    obj.rectangle19:setColor("purple");
    obj.rectangle19:setWidth(90);
    obj.rectangle19:setHeight(25);
    obj.rectangle19:setName("rectangle19");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.rectangle19);
    obj.label121:setAlign("client");
    obj.label121:setText("Concentração");
    obj.label121:setHorzTextAlign("center");
    obj.label121:setName("label121");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout53);
    obj.edit94:setTop(30);
    obj.edit94:setWidth(120);
    obj.edit94:setField("concentracao");
    obj.edit94:setHorzTextAlign("center");
    obj.edit94:setName("edit94");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout50);
    obj.layout54:setAlign("left");
    obj.layout54:setMargins({left=20});
    obj.layout54:setWidth(120);
    obj.layout54:setHeight(80);
    obj.layout54:setName("layout54");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout54);
    obj.rectangle20:setTop(5);
    obj.rectangle20:setLeft(10);
    obj.rectangle20:setColor("purple");
    obj.rectangle20:setWidth(90);
    obj.rectangle20:setHeight(25);
    obj.rectangle20:setName("rectangle20");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.rectangle20);
    obj.label122:setAlign("client");
    obj.label122:setText("Acerto");
    obj.label122:setHorzTextAlign("center");
    obj.label122:setName("label122");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout54);
    obj.edit95:setTop(30);
    obj.edit95:setWidth(120);
    obj.edit95:setField("acerto");
    obj.edit95:setHorzTextAlign("center");
    obj.edit95:setName("edit95");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.tab6);
    obj.layout55:setAlign("top");
    obj.layout55:setHeight(600);
    obj.layout55:setPadding({top=5, left=5});
    obj.layout55:setName("layout55");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout55);
    obj.button1:setLeft(20);
    obj.button1:setTop(20);
    obj.button1:setHeight(25);
    obj.button1:setText("Novo Feitiço");
    obj.button1:setWidth(100);
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout55);
    obj.button2:setLeft(130);
    obj.button2:setTop(20);
    obj.button2:setHeight(25);
    obj.button2:setText("Ordenar");
    obj.button2:setWidth(100);
    obj.button2:setName("button2");

    obj.rclMagias = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMagias:setParent(obj.layout55);
    obj.rclMagias:setName("rclMagias");
    obj.rclMagias:setField("magias");
    obj.rclMagias:setItemHeight(200);
    obj.rclMagias:setTemplateForm("feiticos");
    obj.rclMagias:setLeft(20);
    obj.rclMagias:setTop(60);
    obj.rclMagias:setWidth(760);
    obj.rclMagias:setHeight(450);
    obj.rclMagias:setAutoHeight(false);

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            local campos =
                      {"DES","adivinhacao","azaracao","contraFeitico","encantamento","feitico","transmutacao","arteDasTrevas","fisico","mental","concentracao","acerto"}
                      for x = 1, #campos, 1 do
            
                      if sheet[campos[x]] == nil then
                      sheet[campos[x]] = 0
                      end
            
                      end
        end, obj);

    obj._e_event1 = obj.edit84:addEventListener("onUserChange",
        function (_)
        end, obj);

    obj._e_event2 = obj.edit85:addEventListener("onUserChange",
        function (_)
        end, obj);

    obj._e_event3 = obj.edit86:addEventListener("onUserChange",
        function (_)
        end, obj);

    obj._e_event4 = obj.edit87:addEventListener("onUserChange",
        function (_)
        end, obj);

    obj._e_event5 = obj.edit88:addEventListener("onUserChange",
        function (_)
        end, obj);

    obj._e_event6 = obj.edit89:addEventListener("onUserChange",
        function (_)
        end, obj);

    obj._e_event7 = obj.edit90:addEventListener("onUserChange",
        function (_)
        end, obj);

    obj._e_event8 = obj.edit91:addEventListener("onUserChange",
        function (_)
        end, obj);

    obj._e_event9 = obj.edit92:addEventListener("onUserChange",
        function (_)
            local minhaMesa = Firecast.getRoomOf(sheet);
                                               local chat = minhaMesa.chat;
            
                                               chat:enviarAcao("esta com penalidade em Fisico de " ..
                                               sheet.fisico)
        end, obj);

    obj._e_event10 = obj.edit93:addEventListener("onUserChange",
        function (_)
            local minhaMesa = Firecast.getRoomOf(sheet);
                                               local chat = minhaMesa.chat;
            
                                               chat:enviarAcao("esta com penalidade em Mental de " ..
                                               sheet.mental)
        end, obj);

    obj._e_event11 = obj.edit94:addEventListener("onUserChange",
        function (_)
        end, obj);

    obj._e_event12 = obj.edit95:addEventListener("onUserChange",
        function (_)
        end, obj);

    obj._e_event13 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclMagias:append();
        end, obj);

    obj._e_event14 = obj.button2:addEventListener("onClick",
        function (_)
            self.rclMagias:sort();
        end, obj);

    obj._e_event15 = obj.rclMagias:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if (tonumber(nodeA.Order) or 0) < (tonumber(nodeB.Order) or 0) then
                                               return -1;
                                          elseif (tonumber(nodeA.Order) or 0) > (tonumber(nodeB.Order) or 0) then
                                               return 1;
                                          else   
                                               return Utils.compareStringPtBr(nodeA.nome, nodeB.nome);
                                          end;
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
        __o_rrpgObjs.removeEventListenerById(self._e_event2);
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.rclMagias ~= nil then self.rclMagias:destroy(); self.rclMagias = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.tabControl3 ~= nil then self.tabControl3:destroy(); self.tabControl3 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tabControl2 ~= nil then self.tabControl2:destroy(); self.tabControl2 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newHarryFicha()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_HarryFicha();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _HarryFicha = {
    newEditor = newHarryFicha, 
    new = newHarryFicha, 
    name = "HarryFicha", 
    dataType = "HarryPlugin", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha Harry Potter Nova!", 
    description=""};

HarryFicha = _HarryFicha;
Firecast.registrarForm(_HarryFicha);
Firecast.registrarDataType(_HarryFicha);

return _HarryFicha;
