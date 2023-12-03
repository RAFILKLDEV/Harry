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


          local function TotalPericia(ATR, MOD, OUT)
          local total = 0

          total = ATR + MOD + OUT

          return total
          end
     


    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'AGI','DES', 'FOR','LUT','VIG','INTE','PRE','SAB','ACR_Grad','ACR_Out','ATL_Grad',
          'ATL_Out','COR_Grad','COR_Out','FUR_Grad','FUR_Out','PRE_Grad','PRE_Out','VEI_Grad','VEI_Out',
          'CON_Grad','CON_Out','INT_Grad','INT_Out','INTU_Grad','INTU_Out','PERC_Grad','PERC_Out','PERS_Grad','PERS_Out',
          'TRA_Grad','TRA_Out','ATU_Grad','ATU_Out','C_ADI_Grad','C_ADI_Out','C_AZA_Grad','C_AZA_Out','C_CON_Grad','C_CON_Out',
          'C_CRI_Grad','C_CRI_Out','C_ENC_Grad','C_ENC_Out','C_FEI_Grad','C_FEI_Out','C_HER_Grad','C_HER_Out','C_MAL_Grad','C_MAL_Out','C_POC_Grad','C_POC_Out',
          'C_RUN_Grad','C_RUN_Out','C_TRA_Grad','C_TRA_Out'});
    obj.dataLink1:setName("dataLink1");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Jogador");
    obj.tab1:setName("tab1");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.tab1);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(20);
    obj.rectangle1:setTop(20);
    obj.rectangle1:setWidth(200);
    obj.rectangle1:setHeight(200);
    obj.rectangle1:setName("rectangle1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setField("imagemDoPersonagem");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setLeft(20);
    obj.image1:setTop(20);
    obj.image1:setWidth(200);
    obj.image1:setHeight(200);
    obj.image1:setName("image1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(20);
    obj.layout2:setTop(20);
    obj.layout2:setWidth(1300);
    obj.layout2:setHeight(1000);
    obj.layout2:setName("layout2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
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

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setLeft(0);
    obj.layout3:setTop(220);
    obj.layout3:setWidth(200);
    obj.layout3:setHeight(500);
    obj.layout3:setName("layout3");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout3);
    obj.rectangle3:setAlign("top");
    obj.rectangle3:setHeight(40);
    obj.rectangle3:setColor("blue");
    obj.rectangle3:setName("rectangle3");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle3);
    obj.label9:setMargins({left=5});
    obj.label9:setHorzTextAlign("center");
    obj.label9:setAlign("left");
    obj.label9:setWidth(100);
    obj.label9:setText("CORPO");
    obj.label9:setName("label9");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle3);
    obj.label10:setMargins({left=5});
    obj.label10:setHorzTextAlign("center");
    obj.label10:setAlign("left");
    obj.label10:setWidth(40);
    obj.label10:setText("MOD");
    obj.label10:setName("label10");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle3);
    obj.label11:setMargins({left=5});
    obj.label11:setHorzTextAlign("center");
    obj.label11:setAlign("left");
    obj.label11:setWidth(40);
    obj.label11:setText("OUT");
    obj.label11:setName("label11");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout3);
    obj.rectangle4:setPadding({top=3,bottom=5});
    obj.rectangle4:setAlign("top");
    obj.rectangle4:setHeight(35);
    obj.rectangle4:setColor("blue");
    obj.rectangle4:setName("rectangle4");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle4);
    obj.label12:setMargins({left=5});
    obj.label12:setAlign("left");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setWidth(100);
    obj.label12:setText("AGILIDADE");
    obj.label12:setName("label12");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle4);
    obj.edit8:setMargins({left=5});
    obj.edit8:setAlign("left");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setWidth(40);
    obj.edit8:setField("AGI");
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle4);
    obj.edit9:setMargins({left=5});
    obj.edit9:setAlign("left");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setWidth(40);
    obj.edit9:setField("AGI_OUT");
    obj.edit9:setName("edit9");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout3);
    obj.rectangle5:setPadding({top=3,bottom=5});
    obj.rectangle5:setAlign("top");
    obj.rectangle5:setHeight(35);
    obj.rectangle5:setColor("blue");
    obj.rectangle5:setName("rectangle5");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle5);
    obj.label13:setMargins({left=5});
    obj.label13:setAlign("left");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setWidth(100);
    obj.label13:setText("DESTREZA");
    obj.label13:setName("label13");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle5);
    obj.edit10:setMargins({left=5});
    obj.edit10:setAlign("left");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setWidth(40);
    obj.edit10:setField("DES");
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectangle5);
    obj.edit11:setMargins({left=5});
    obj.edit11:setAlign("left");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setWidth(40);
    obj.edit11:setField("DES_OUT");
    obj.edit11:setName("edit11");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout3);
    obj.rectangle6:setPadding({top=3,bottom=5});
    obj.rectangle6:setAlign("top");
    obj.rectangle6:setHeight(35);
    obj.rectangle6:setColor("blue");
    obj.rectangle6:setName("rectangle6");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectangle6);
    obj.label14:setMargins({left=5});
    obj.label14:setAlign("left");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setWidth(100);
    obj.label14:setText("FORÇA");
    obj.label14:setName("label14");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.rectangle6);
    obj.edit12:setMargins({left=5});
    obj.edit12:setAlign("left");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setWidth(40);
    obj.edit12:setField("FOR");
    obj.edit12:setName("edit12");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.rectangle6);
    obj.edit13:setMargins({left=5});
    obj.edit13:setAlign("left");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setWidth(40);
    obj.edit13:setField("FOR_OUT");
    obj.edit13:setName("edit13");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout3);
    obj.rectangle7:setPadding({top=3,bottom=5});
    obj.rectangle7:setAlign("top");
    obj.rectangle7:setHeight(35);
    obj.rectangle7:setColor("blue");
    obj.rectangle7:setName("rectangle7");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.rectangle7);
    obj.label15:setMargins({left=5});
    obj.label15:setAlign("left");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setWidth(100);
    obj.label15:setText("LUTA");
    obj.label15:setName("label15");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.rectangle7);
    obj.edit14:setMargins({left=5});
    obj.edit14:setAlign("left");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setWidth(40);
    obj.edit14:setField("LUT");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.rectangle7);
    obj.edit15:setMargins({left=5});
    obj.edit15:setAlign("left");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setWidth(40);
    obj.edit15:setField("LUT_OUT");
    obj.edit15:setName("edit15");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout3);
    obj.rectangle8:setPadding({top=3,bottom=5});
    obj.rectangle8:setAlign("top");
    obj.rectangle8:setHeight(35);
    obj.rectangle8:setColor("blue");
    obj.rectangle8:setName("rectangle8");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectangle8);
    obj.label16:setMargins({left=5});
    obj.label16:setAlign("left");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setWidth(100);
    obj.label16:setText("VIGOR");
    obj.label16:setName("label16");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.rectangle8);
    obj.edit16:setMargins({left=5});
    obj.edit16:setAlign("left");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setWidth(40);
    obj.edit16:setField("VIG");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.rectangle8);
    obj.edit17:setMargins({left=5});
    obj.edit17:setAlign("left");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setWidth(40);
    obj.edit17:setField("VIG_OUT");
    obj.edit17:setName("edit17");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout3);
    obj.rectangle9:setAlign("top");
    obj.rectangle9:setMargins({top=15});
    obj.rectangle9:setHeight(40);
    obj.rectangle9:setColor("blue");
    obj.rectangle9:setName("rectangle9");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.rectangle9);
    obj.label17:setMargins({left=5});
    obj.label17:setHorzTextAlign("center");
    obj.label17:setAlign("left");
    obj.label17:setWidth(100);
    obj.label17:setText("MENTE");
    obj.label17:setName("label17");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.rectangle9);
    obj.label18:setMargins({left=5});
    obj.label18:setHorzTextAlign("center");
    obj.label18:setAlign("left");
    obj.label18:setWidth(40);
    obj.label18:setText("MOD");
    obj.label18:setName("label18");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.rectangle9);
    obj.label19:setMargins({left=5});
    obj.label19:setHorzTextAlign("center");
    obj.label19:setAlign("left");
    obj.label19:setWidth(40);
    obj.label19:setText("OUT");
    obj.label19:setName("label19");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout3);
    obj.rectangle10:setPadding({top=3,bottom=5});
    obj.rectangle10:setAlign("top");
    obj.rectangle10:setHeight(35);
    obj.rectangle10:setColor("blue");
    obj.rectangle10:setName("rectangle10");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.rectangle10);
    obj.label20:setMargins({left=5});
    obj.label20:setAlign("left");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setWidth(100);
    obj.label20:setText("INTELIGENCIA");
    obj.label20:setName("label20");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.rectangle10);
    obj.edit18:setMargins({left=5});
    obj.edit18:setAlign("left");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setWidth(40);
    obj.edit18:setField("INTE");
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.rectangle10);
    obj.edit19:setMargins({left=5});
    obj.edit19:setAlign("left");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setWidth(40);
    obj.edit19:setField("INTE_OUT");
    obj.edit19:setName("edit19");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout3);
    obj.rectangle11:setPadding({top=3,bottom=5});
    obj.rectangle11:setAlign("top");
    obj.rectangle11:setHeight(35);
    obj.rectangle11:setColor("blue");
    obj.rectangle11:setName("rectangle11");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.rectangle11);
    obj.label21:setMargins({left=5});
    obj.label21:setAlign("left");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setWidth(100);
    obj.label21:setText("PRESENÇA");
    obj.label21:setName("label21");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.rectangle11);
    obj.edit20:setMargins({left=5});
    obj.edit20:setAlign("left");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setWidth(40);
    obj.edit20:setField("PRE");
    obj.edit20:setName("edit20");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.rectangle11);
    obj.edit21:setMargins({left=5});
    obj.edit21:setAlign("left");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setWidth(40);
    obj.edit21:setField("PRES_OUT");
    obj.edit21:setName("edit21");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout3);
    obj.rectangle12:setPadding({top=3,bottom=5});
    obj.rectangle12:setAlign("top");
    obj.rectangle12:setHeight(35);
    obj.rectangle12:setColor("blue");
    obj.rectangle12:setName("rectangle12");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.rectangle12);
    obj.label22:setMargins({left=5});
    obj.label22:setAlign("left");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setWidth(100);
    obj.label22:setText("SABEDORIA");
    obj.label22:setName("label22");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.rectangle12);
    obj.edit22:setMargins({left=5});
    obj.edit22:setAlign("left");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setWidth(40);
    obj.edit22:setField("SAB");
    obj.edit22:setName("edit22");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.rectangle12);
    obj.edit23:setMargins({left=5});
    obj.edit23:setAlign("left");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setWidth(40);
    obj.edit23:setField("SAB_OUT");
    obj.edit23:setName("edit23");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.scrollBox1);
    obj.layout4:setLeft(240);
    obj.layout4:setTop(200);
    obj.layout4:setWidth(1300);
    obj.layout4:setHeight(600);
    obj.layout4:setName("layout4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout4);
    obj.layout5:setWidth(800);
    obj.layout5:setHeight(700);
    obj.layout5:setName("layout5");

    obj.tabControl2 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl2:setParent(obj.layout5);
    obj.tabControl2:setAlign("left");
    obj.tabControl2:setWidth(350);
    obj.tabControl2:setName("tabControl2");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl2);
    obj.tab2:setTitle("  Corpo              ");
    obj.tab2:setWidth(134);
    obj.tab2:setName("tab2");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.tab2);
    obj.layout6:setHeight(250);
    obj.layout6:setAlign("top");
    obj.layout6:setMargins({left=35});
    obj.layout6:setName("layout6");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout6);
    obj.label23:setAlign("top");
    obj.label23:setHeight(50);
    obj.label23:setText("Corpo");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout6);
    obj.layout7:setHeight(30);
    obj.layout7:setAlign("top");
    obj.layout7:setMargins({top=3});
    obj.layout7:setName("layout7");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout7);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setAlign("left");
    obj.rectangle13:setWidth(120);
    obj.rectangle13:setName("rectangle13");

    obj.Acrobacia = GUI.fromHandle(_obj_newObject("label"));
    obj.Acrobacia:setParent(obj.rectangle13);
    obj.Acrobacia:setName("Acrobacia");
    obj.Acrobacia:setText("Acrobacia");
    obj.Acrobacia:setTop(5);
    obj.Acrobacia:setHorzTextAlign("center");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout7);
    obj.edit24:setField("ACR_Grad");
    obj.edit24:setAlign("left");
    obj.edit24:setMargins({left = 5});
    obj.edit24:setWidth(30);
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setName("edit24");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout7);
    obj.edit25:setField("ACR_Out");
    obj.edit25:setAlign("left");
    obj.edit25:setMargins({left = 5});
    obj.edit25:setWidth(30);
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setName("edit25");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout7);
    obj.label24:setField("AGI");
    obj.label24:setAlign("left");
    obj.label24:setMargins({left = 5});
    obj.label24:setWidth(30);
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout7);
    obj.label25:setField("ACR_Total");
    obj.label25:setAlign("left");
    obj.label25:setMargins({left = 5});
    obj.label25:setWidth(30);
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout6);
    obj.layout8:setHeight(30);
    obj.layout8:setAlign("top");
    obj.layout8:setMargins({top=3});
    obj.layout8:setName("layout8");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout8);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setAlign("left");
    obj.rectangle14:setWidth(120);
    obj.rectangle14:setName("rectangle14");

    obj.Atlestismo = GUI.fromHandle(_obj_newObject("label"));
    obj.Atlestismo:setParent(obj.rectangle14);
    obj.Atlestismo:setName("Atlestismo");
    obj.Atlestismo:setText("Atlestismo");
    obj.Atlestismo:setTop(5);
    obj.Atlestismo:setHorzTextAlign("center");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout8);
    obj.edit26:setField("ATL_Grad");
    obj.edit26:setAlign("left");
    obj.edit26:setMargins({left = 5});
    obj.edit26:setWidth(30);
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setName("edit26");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout8);
    obj.edit27:setField("ATL_Out");
    obj.edit27:setAlign("left");
    obj.edit27:setMargins({left = 5});
    obj.edit27:setWidth(30);
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setName("edit27");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout8);
    obj.label26:setField("FOR");
    obj.label26:setAlign("left");
    obj.label26:setMargins({left = 5});
    obj.label26:setWidth(30);
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout8);
    obj.label27:setField("ATL_Total");
    obj.label27:setAlign("left");
    obj.label27:setMargins({left = 5});
    obj.label27:setWidth(30);
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout6);
    obj.layout9:setHeight(30);
    obj.layout9:setAlign("top");
    obj.layout9:setMargins({top=3});
    obj.layout9:setName("layout9");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout9);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setAlign("left");
    obj.rectangle15:setWidth(120);
    obj.rectangle15:setName("rectangle15");

    obj.CorpoACorpo = GUI.fromHandle(_obj_newObject("label"));
    obj.CorpoACorpo:setParent(obj.rectangle15);
    obj.CorpoACorpo:setName("CorpoACorpo");
    obj.CorpoACorpo:setText("Corpo-a-Corpo");
    obj.CorpoACorpo:setTop(5);
    obj.CorpoACorpo:setHorzTextAlign("center");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout9);
    obj.edit28:setField("COR_Grad");
    obj.edit28:setAlign("left");
    obj.edit28:setMargins({left = 5});
    obj.edit28:setWidth(30);
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setName("edit28");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout9);
    obj.edit29:setField("COR_Out");
    obj.edit29:setAlign("left");
    obj.edit29:setMargins({left = 5});
    obj.edit29:setWidth(30);
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setName("edit29");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout9);
    obj.label28:setField("LUT");
    obj.label28:setAlign("left");
    obj.label28:setMargins({left = 5});
    obj.label28:setWidth(30);
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout9);
    obj.label29:setField("COR_Total");
    obj.label29:setAlign("left");
    obj.label29:setMargins({left = 5});
    obj.label29:setWidth(30);
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout6);
    obj.layout10:setHeight(30);
    obj.layout10:setAlign("top");
    obj.layout10:setMargins({top=3});
    obj.layout10:setName("layout10");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout10);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setAlign("left");
    obj.rectangle16:setWidth(120);
    obj.rectangle16:setName("rectangle16");

    obj.Furtividade = GUI.fromHandle(_obj_newObject("label"));
    obj.Furtividade:setParent(obj.rectangle16);
    obj.Furtividade:setName("Furtividade");
    obj.Furtividade:setText("Furtividade");
    obj.Furtividade:setTop(5);
    obj.Furtividade:setHorzTextAlign("center");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout10);
    obj.edit30:setField("FUR_Grad");
    obj.edit30:setAlign("left");
    obj.edit30:setMargins({left = 5});
    obj.edit30:setWidth(30);
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setName("edit30");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout10);
    obj.edit31:setField("FUR_Out");
    obj.edit31:setAlign("left");
    obj.edit31:setMargins({left = 5});
    obj.edit31:setWidth(30);
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setName("edit31");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout10);
    obj.label30:setField("AGI");
    obj.label30:setAlign("left");
    obj.label30:setMargins({left = 5});
    obj.label30:setWidth(30);
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout10);
    obj.label31:setField("FUR_Total");
    obj.label31:setAlign("left");
    obj.label31:setMargins({left = 5});
    obj.label31:setWidth(30);
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout6);
    obj.layout11:setHeight(30);
    obj.layout11:setAlign("top");
    obj.layout11:setMargins({top=3});
    obj.layout11:setName("layout11");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout11);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setAlign("left");
    obj.rectangle17:setWidth(120);
    obj.rectangle17:setName("rectangle17");

    obj.Prestidigitacao = GUI.fromHandle(_obj_newObject("label"));
    obj.Prestidigitacao:setParent(obj.rectangle17);
    obj.Prestidigitacao:setName("Prestidigitacao");
    obj.Prestidigitacao:setText("Prestidigitação");
    obj.Prestidigitacao:setTop(5);
    obj.Prestidigitacao:setHorzTextAlign("center");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout11);
    obj.edit32:setField("PRE_Grad");
    obj.edit32:setAlign("left");
    obj.edit32:setMargins({left = 5});
    obj.edit32:setWidth(30);
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setName("edit32");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout11);
    obj.edit33:setField("PRE_Out");
    obj.edit33:setAlign("left");
    obj.edit33:setMargins({left = 5});
    obj.edit33:setWidth(30);
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setName("edit33");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout11);
    obj.label32:setField("DES");
    obj.label32:setAlign("left");
    obj.label32:setMargins({left = 5});
    obj.label32:setWidth(30);
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout11);
    obj.label33:setField("PRE_Total");
    obj.label33:setAlign("left");
    obj.label33:setMargins({left = 5});
    obj.label33:setWidth(30);
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout6);
    obj.layout12:setHeight(30);
    obj.layout12:setAlign("top");
    obj.layout12:setMargins({top=3});
    obj.layout12:setName("layout12");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout12);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setAlign("left");
    obj.rectangle18:setWidth(120);
    obj.rectangle18:setName("rectangle18");

    obj.VeiculosMagicos = GUI.fromHandle(_obj_newObject("label"));
    obj.VeiculosMagicos:setParent(obj.rectangle18);
    obj.VeiculosMagicos:setName("VeiculosMagicos");
    obj.VeiculosMagicos:setText("Veiculos Mágicos");
    obj.VeiculosMagicos:setTop(5);
    obj.VeiculosMagicos:setHorzTextAlign("center");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout12);
    obj.edit34:setField("VEI_Grad");
    obj.edit34:setAlign("left");
    obj.edit34:setMargins({left = 5});
    obj.edit34:setWidth(30);
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setName("edit34");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout12);
    obj.edit35:setField("VEI_Out");
    obj.edit35:setAlign("left");
    obj.edit35:setMargins({left = 5});
    obj.edit35:setWidth(30);
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setName("edit35");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout12);
    obj.label34:setField("AGI");
    obj.label34:setAlign("left");
    obj.label34:setMargins({left = 5});
    obj.label34:setWidth(30);
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout12);
    obj.label35:setField("VEI_Total");
    obj.label35:setAlign("left");
    obj.label35:setMargins({left = 5});
    obj.label35:setWidth(30);
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl2);
    obj.tab3:setTitle("  Mente              ");
    obj.tab3:setWidth(134);
    obj.tab3:setName("tab3");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.tab3);
    obj.layout13:setHeight(320);
    obj.layout13:setMargins({left=35});
    obj.layout13:setAlign("top");
    obj.layout13:setName("layout13");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout13);
    obj.label36:setAlign("top");
    obj.label36:setHeight(50);
    obj.label36:setText("Mente");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout13);
    obj.layout14:setHeight(30);
    obj.layout14:setAlign("top");
    obj.layout14:setMargins({top=3});
    obj.layout14:setName("layout14");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout14);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setAlign("left");
    obj.rectangle19:setWidth(120);
    obj.rectangle19:setName("rectangle19");

    obj.Concentracao = GUI.fromHandle(_obj_newObject("label"));
    obj.Concentracao:setParent(obj.rectangle19);
    obj.Concentracao:setName("Concentracao");
    obj.Concentracao:setText("Concentração");
    obj.Concentracao:setTop(5);
    obj.Concentracao:setHorzTextAlign("center");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout14);
    obj.edit36:setField("CON_Grad");
    obj.edit36:setAlign("left");
    obj.edit36:setMargins({left = 5});
    obj.edit36:setWidth(30);
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setName("edit36");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout14);
    obj.edit37:setField("CON_Out");
    obj.edit37:setAlign("left");
    obj.edit37:setMargins({left = 5});
    obj.edit37:setWidth(30);
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setName("edit37");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout14);
    obj.label37:setField("SAB");
    obj.label37:setAlign("left");
    obj.label37:setMargins({left = 5});
    obj.label37:setWidth(30);
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout14);
    obj.label38:setField("CON_Total");
    obj.label38:setAlign("left");
    obj.label38:setMargins({left = 5});
    obj.label38:setWidth(30);
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout13);
    obj.layout15:setHeight(30);
    obj.layout15:setAlign("top");
    obj.layout15:setMargins({top=3});
    obj.layout15:setName("layout15");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout15);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setAlign("left");
    obj.rectangle20:setWidth(120);
    obj.rectangle20:setName("rectangle20");

    obj.Enganacao = GUI.fromHandle(_obj_newObject("label"));
    obj.Enganacao:setParent(obj.rectangle20);
    obj.Enganacao:setName("Enganacao");
    obj.Enganacao:setText("Enganação");
    obj.Enganacao:setTop(5);
    obj.Enganacao:setHorzTextAlign("center");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout15);
    obj.edit38:setField("ENG_Grad");
    obj.edit38:setAlign("left");
    obj.edit38:setMargins({left = 5});
    obj.edit38:setWidth(30);
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setName("edit38");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout15);
    obj.edit39:setField("ENG_Out");
    obj.edit39:setAlign("left");
    obj.edit39:setMargins({left = 5});
    obj.edit39:setWidth(30);
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setName("edit39");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout15);
    obj.label39:setField("PRE");
    obj.label39:setAlign("left");
    obj.label39:setMargins({left = 5});
    obj.label39:setWidth(30);
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout15);
    obj.label40:setField("ENG_Total");
    obj.label40:setAlign("left");
    obj.label40:setMargins({left = 5});
    obj.label40:setWidth(30);
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout13);
    obj.layout16:setHeight(30);
    obj.layout16:setAlign("top");
    obj.layout16:setMargins({top=3});
    obj.layout16:setName("layout16");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout16);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setAlign("left");
    obj.rectangle21:setWidth(120);
    obj.rectangle21:setName("rectangle21");

    obj.Intimidacao = GUI.fromHandle(_obj_newObject("label"));
    obj.Intimidacao:setParent(obj.rectangle21);
    obj.Intimidacao:setName("Intimidacao");
    obj.Intimidacao:setText("Intimidação");
    obj.Intimidacao:setTop(5);
    obj.Intimidacao:setHorzTextAlign("center");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout16);
    obj.edit40:setField("INT_Grad");
    obj.edit40:setAlign("left");
    obj.edit40:setMargins({left = 5});
    obj.edit40:setWidth(30);
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setName("edit40");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout16);
    obj.edit41:setField("INT_Out");
    obj.edit41:setAlign("left");
    obj.edit41:setMargins({left = 5});
    obj.edit41:setWidth(30);
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setName("edit41");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout16);
    obj.label41:setField("PRE");
    obj.label41:setAlign("left");
    obj.label41:setMargins({left = 5});
    obj.label41:setWidth(30);
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout16);
    obj.label42:setField("INT_Total");
    obj.label42:setAlign("left");
    obj.label42:setMargins({left = 5});
    obj.label42:setWidth(30);
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout13);
    obj.layout17:setHeight(30);
    obj.layout17:setAlign("top");
    obj.layout17:setMargins({top=3});
    obj.layout17:setName("layout17");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout17);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setAlign("left");
    obj.rectangle22:setWidth(120);
    obj.rectangle22:setName("rectangle22");

    obj.Intuicao = GUI.fromHandle(_obj_newObject("label"));
    obj.Intuicao:setParent(obj.rectangle22);
    obj.Intuicao:setName("Intuicao");
    obj.Intuicao:setText("Intuição");
    obj.Intuicao:setTop(5);
    obj.Intuicao:setHorzTextAlign("center");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout17);
    obj.edit42:setField("INTU_Grad");
    obj.edit42:setAlign("left");
    obj.edit42:setMargins({left = 5});
    obj.edit42:setWidth(30);
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setName("edit42");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout17);
    obj.edit43:setField("INTU_Out");
    obj.edit43:setAlign("left");
    obj.edit43:setMargins({left = 5});
    obj.edit43:setWidth(30);
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setName("edit43");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout17);
    obj.label43:setField("SAB");
    obj.label43:setAlign("left");
    obj.label43:setMargins({left = 5});
    obj.label43:setWidth(30);
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout17);
    obj.label44:setField("INTU_Total");
    obj.label44:setAlign("left");
    obj.label44:setMargins({left = 5});
    obj.label44:setWidth(30);
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout13);
    obj.layout18:setHeight(30);
    obj.layout18:setAlign("top");
    obj.layout18:setMargins({top=3});
    obj.layout18:setName("layout18");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout18);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setAlign("left");
    obj.rectangle23:setWidth(120);
    obj.rectangle23:setName("rectangle23");

    obj.Percepcao = GUI.fromHandle(_obj_newObject("label"));
    obj.Percepcao:setParent(obj.rectangle23);
    obj.Percepcao:setName("Percepcao");
    obj.Percepcao:setText("Percepção");
    obj.Percepcao:setTop(5);
    obj.Percepcao:setHorzTextAlign("center");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout18);
    obj.edit44:setField("PERC_Grad");
    obj.edit44:setAlign("left");
    obj.edit44:setMargins({left = 5});
    obj.edit44:setWidth(30);
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setName("edit44");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout18);
    obj.edit45:setField("PERC_Out");
    obj.edit45:setAlign("left");
    obj.edit45:setMargins({left = 5});
    obj.edit45:setWidth(30);
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setName("edit45");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout18);
    obj.label45:setField("SAB");
    obj.label45:setAlign("left");
    obj.label45:setMargins({left = 5});
    obj.label45:setWidth(30);
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout18);
    obj.label46:setField("PERC_Total");
    obj.label46:setAlign("left");
    obj.label46:setMargins({left = 5});
    obj.label46:setWidth(30);
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout13);
    obj.layout19:setHeight(30);
    obj.layout19:setAlign("top");
    obj.layout19:setMargins({top=3});
    obj.layout19:setName("layout19");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout19);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setAlign("left");
    obj.rectangle24:setWidth(120);
    obj.rectangle24:setName("rectangle24");

    obj.Persuacao = GUI.fromHandle(_obj_newObject("label"));
    obj.Persuacao:setParent(obj.rectangle24);
    obj.Persuacao:setName("Persuacao");
    obj.Persuacao:setText("Persuação");
    obj.Persuacao:setTop(5);
    obj.Persuacao:setHorzTextAlign("center");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout19);
    obj.edit46:setField("PERS_Grad");
    obj.edit46:setAlign("left");
    obj.edit46:setMargins({left = 5});
    obj.edit46:setWidth(30);
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setName("edit46");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout19);
    obj.edit47:setField("PERS_Out");
    obj.edit47:setAlign("left");
    obj.edit47:setMargins({left = 5});
    obj.edit47:setWidth(30);
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setName("edit47");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout19);
    obj.label47:setField("PRE");
    obj.label47:setAlign("left");
    obj.label47:setMargins({left = 5});
    obj.label47:setWidth(30);
    obj.label47:setHorzTextAlign("center");
    obj.label47:setName("label47");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout19);
    obj.label48:setField("PERS_Total");
    obj.label48:setAlign("left");
    obj.label48:setMargins({left = 5});
    obj.label48:setWidth(30);
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout13);
    obj.layout20:setHeight(30);
    obj.layout20:setAlign("top");
    obj.layout20:setMargins({top=3});
    obj.layout20:setName("layout20");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout20);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setAlign("left");
    obj.rectangle25:setWidth(120);
    obj.rectangle25:setName("rectangle25");

    obj.Tratamento = GUI.fromHandle(_obj_newObject("label"));
    obj.Tratamento:setParent(obj.rectangle25);
    obj.Tratamento:setName("Tratamento");
    obj.Tratamento:setText("Tratamento");
    obj.Tratamento:setTop(5);
    obj.Tratamento:setHorzTextAlign("center");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout20);
    obj.edit48:setField("TRA_Grad");
    obj.edit48:setAlign("left");
    obj.edit48:setMargins({left = 5});
    obj.edit48:setWidth(30);
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setName("edit48");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout20);
    obj.edit49:setField("TRA_Out");
    obj.edit49:setAlign("left");
    obj.edit49:setMargins({left = 5});
    obj.edit49:setWidth(30);
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setName("edit49");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout20);
    obj.label49:setField("INTE");
    obj.label49:setAlign("left");
    obj.label49:setMargins({left = 5});
    obj.label49:setWidth(30);
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout20);
    obj.label50:setField("TRA_Total");
    obj.label50:setAlign("left");
    obj.label50:setMargins({left = 5});
    obj.label50:setWidth(30);
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl2);
    obj.tab4:setTitle("  Conhecimentos       ");
    obj.tab4:setWidth(134);
    obj.tab4:setName("tab4");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.tab4);
    obj.layout21:setHeight(600);
    obj.layout21:setMargins({left=35});
    obj.layout21:setAlign("top");
    obj.layout21:setName("layout21");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout21);
    obj.label51:setAlign("top");
    obj.label51:setHeight(50);
    obj.label51:setText("Conhecimentos");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout21);
    obj.layout22:setHeight(30);
    obj.layout22:setAlign("top");
    obj.layout22:setMargins({top=3});
    obj.layout22:setName("layout22");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout22);
    obj.rectangle26:setColor("black");
    obj.rectangle26:setAlign("left");
    obj.rectangle26:setWidth(120);
    obj.rectangle26:setName("rectangle26");

    obj.Atualidades = GUI.fromHandle(_obj_newObject("label"));
    obj.Atualidades:setParent(obj.rectangle26);
    obj.Atualidades:setName("Atualidades");
    obj.Atualidades:setText("Atualidades");
    obj.Atualidades:setTop(5);
    obj.Atualidades:setHorzTextAlign("center");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout22);
    obj.edit50:setField("ATU_Grad");
    obj.edit50:setAlign("left");
    obj.edit50:setMargins({left = 5});
    obj.edit50:setWidth(30);
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setName("edit50");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout22);
    obj.edit51:setField("ATU_Out");
    obj.edit51:setAlign("left");
    obj.edit51:setMargins({left = 5});
    obj.edit51:setWidth(30);
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setName("edit51");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout22);
    obj.label52:setField("INTE");
    obj.label52:setAlign("left");
    obj.label52:setMargins({left = 5});
    obj.label52:setWidth(30);
    obj.label52:setHorzTextAlign("center");
    obj.label52:setName("label52");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout22);
    obj.label53:setField("ATU_Total");
    obj.label53:setAlign("left");
    obj.label53:setMargins({left = 5});
    obj.label53:setWidth(30);
    obj.label53:setHorzTextAlign("center");
    obj.label53:setName("label53");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout21);
    obj.layout23:setHeight(30);
    obj.layout23:setAlign("top");
    obj.layout23:setMargins({top=3});
    obj.layout23:setName("layout23");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout23);
    obj.rectangle27:setColor("black");
    obj.rectangle27:setAlign("left");
    obj.rectangle27:setWidth(120);
    obj.rectangle27:setName("rectangle27");

    obj.Adivinhacao = GUI.fromHandle(_obj_newObject("label"));
    obj.Adivinhacao:setParent(obj.rectangle27);
    obj.Adivinhacao:setName("Adivinhacao");
    obj.Adivinhacao:setText("Adivinhação");
    obj.Adivinhacao:setTop(5);
    obj.Adivinhacao:setHorzTextAlign("center");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout23);
    obj.edit52:setField("C_ADI_Grad");
    obj.edit52:setAlign("left");
    obj.edit52:setMargins({left = 5});
    obj.edit52:setWidth(30);
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setName("edit52");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout23);
    obj.edit53:setField("C_ADI_Out");
    obj.edit53:setAlign("left");
    obj.edit53:setMargins({left = 5});
    obj.edit53:setWidth(30);
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setName("edit53");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout23);
    obj.label54:setField("INTE");
    obj.label54:setAlign("left");
    obj.label54:setMargins({left = 5});
    obj.label54:setWidth(30);
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout23);
    obj.label55:setField("C_ADI_Total");
    obj.label55:setAlign("left");
    obj.label55:setMargins({left = 5});
    obj.label55:setWidth(30);
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout21);
    obj.layout24:setHeight(30);
    obj.layout24:setAlign("top");
    obj.layout24:setMargins({top=3});
    obj.layout24:setName("layout24");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout24);
    obj.rectangle28:setColor("black");
    obj.rectangle28:setAlign("left");
    obj.rectangle28:setWidth(120);
    obj.rectangle28:setName("rectangle28");

    obj.Azaracao = GUI.fromHandle(_obj_newObject("label"));
    obj.Azaracao:setParent(obj.rectangle28);
    obj.Azaracao:setName("Azaracao");
    obj.Azaracao:setText("Azaração");
    obj.Azaracao:setTop(5);
    obj.Azaracao:setHorzTextAlign("center");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout24);
    obj.edit54:setField("C_AZA_Grad");
    obj.edit54:setAlign("left");
    obj.edit54:setMargins({left = 5});
    obj.edit54:setWidth(30);
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setName("edit54");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout24);
    obj.edit55:setField("C_AZA_Out");
    obj.edit55:setAlign("left");
    obj.edit55:setMargins({left = 5});
    obj.edit55:setWidth(30);
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setName("edit55");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout24);
    obj.label56:setField("INTE");
    obj.label56:setAlign("left");
    obj.label56:setMargins({left = 5});
    obj.label56:setWidth(30);
    obj.label56:setHorzTextAlign("center");
    obj.label56:setName("label56");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout24);
    obj.label57:setField("C_AZA_Total");
    obj.label57:setAlign("left");
    obj.label57:setMargins({left = 5});
    obj.label57:setWidth(30);
    obj.label57:setHorzTextAlign("center");
    obj.label57:setName("label57");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout21);
    obj.layout25:setHeight(30);
    obj.layout25:setAlign("top");
    obj.layout25:setMargins({top=3});
    obj.layout25:setName("layout25");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout25);
    obj.rectangle29:setColor("black");
    obj.rectangle29:setAlign("left");
    obj.rectangle29:setWidth(120);
    obj.rectangle29:setName("rectangle29");

    obj.ContraFeitico = GUI.fromHandle(_obj_newObject("label"));
    obj.ContraFeitico:setParent(obj.rectangle29);
    obj.ContraFeitico:setName("ContraFeitico");
    obj.ContraFeitico:setText("Contra-Feitiço");
    obj.ContraFeitico:setTop(5);
    obj.ContraFeitico:setHorzTextAlign("center");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout25);
    obj.edit56:setField("C_CON_Grad");
    obj.edit56:setAlign("left");
    obj.edit56:setMargins({left = 5});
    obj.edit56:setWidth(30);
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setName("edit56");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout25);
    obj.edit57:setField("C_CON_Out");
    obj.edit57:setAlign("left");
    obj.edit57:setMargins({left = 5});
    obj.edit57:setWidth(30);
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setName("edit57");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout25);
    obj.label58:setField("INTE");
    obj.label58:setAlign("left");
    obj.label58:setMargins({left = 5});
    obj.label58:setWidth(30);
    obj.label58:setHorzTextAlign("center");
    obj.label58:setName("label58");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout25);
    obj.label59:setField("C_CON_Total");
    obj.label59:setAlign("left");
    obj.label59:setMargins({left = 5});
    obj.label59:setWidth(30);
    obj.label59:setHorzTextAlign("center");
    obj.label59:setName("label59");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout21);
    obj.layout26:setHeight(30);
    obj.layout26:setAlign("top");
    obj.layout26:setMargins({top=3});
    obj.layout26:setName("layout26");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout26);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setAlign("left");
    obj.rectangle30:setWidth(120);
    obj.rectangle30:setName("rectangle30");

    obj.CriaturasMagicas = GUI.fromHandle(_obj_newObject("label"));
    obj.CriaturasMagicas:setParent(obj.rectangle30);
    obj.CriaturasMagicas:setName("CriaturasMagicas");
    obj.CriaturasMagicas:setText("Criaturas Mágicas");
    obj.CriaturasMagicas:setTop(5);
    obj.CriaturasMagicas:setHorzTextAlign("center");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout26);
    obj.edit58:setField("C_CRI_Grad");
    obj.edit58:setAlign("left");
    obj.edit58:setMargins({left = 5});
    obj.edit58:setWidth(30);
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setName("edit58");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout26);
    obj.edit59:setField("C_CRI_Out");
    obj.edit59:setAlign("left");
    obj.edit59:setMargins({left = 5});
    obj.edit59:setWidth(30);
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setName("edit59");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout26);
    obj.label60:setField("INTE");
    obj.label60:setAlign("left");
    obj.label60:setMargins({left = 5});
    obj.label60:setWidth(30);
    obj.label60:setHorzTextAlign("center");
    obj.label60:setName("label60");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout26);
    obj.label61:setField("C_CRI_Total");
    obj.label61:setAlign("left");
    obj.label61:setMargins({left = 5});
    obj.label61:setWidth(30);
    obj.label61:setHorzTextAlign("center");
    obj.label61:setName("label61");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout21);
    obj.layout27:setHeight(30);
    obj.layout27:setAlign("top");
    obj.layout27:setMargins({top=3});
    obj.layout27:setName("layout27");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout27);
    obj.rectangle31:setColor("black");
    obj.rectangle31:setAlign("left");
    obj.rectangle31:setWidth(120);
    obj.rectangle31:setName("rectangle31");

    obj.Encantamentos = GUI.fromHandle(_obj_newObject("label"));
    obj.Encantamentos:setParent(obj.rectangle31);
    obj.Encantamentos:setName("Encantamentos");
    obj.Encantamentos:setText("Encantamentos");
    obj.Encantamentos:setTop(5);
    obj.Encantamentos:setHorzTextAlign("center");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout27);
    obj.edit60:setField("C_ENC_Grad");
    obj.edit60:setAlign("left");
    obj.edit60:setMargins({left = 5});
    obj.edit60:setWidth(30);
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setName("edit60");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout27);
    obj.edit61:setField("C_ENC_Out");
    obj.edit61:setAlign("left");
    obj.edit61:setMargins({left = 5});
    obj.edit61:setWidth(30);
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setName("edit61");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout27);
    obj.label62:setField("INTE");
    obj.label62:setAlign("left");
    obj.label62:setMargins({left = 5});
    obj.label62:setWidth(30);
    obj.label62:setHorzTextAlign("center");
    obj.label62:setName("label62");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout27);
    obj.label63:setField("C_ENC_Total");
    obj.label63:setAlign("left");
    obj.label63:setMargins({left = 5});
    obj.label63:setWidth(30);
    obj.label63:setHorzTextAlign("center");
    obj.label63:setName("label63");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout21);
    obj.layout28:setHeight(30);
    obj.layout28:setAlign("top");
    obj.layout28:setMargins({top=3});
    obj.layout28:setName("layout28");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout28);
    obj.rectangle32:setColor("black");
    obj.rectangle32:setAlign("left");
    obj.rectangle32:setWidth(120);
    obj.rectangle32:setName("rectangle32");

    obj.Feiticos = GUI.fromHandle(_obj_newObject("label"));
    obj.Feiticos:setParent(obj.rectangle32);
    obj.Feiticos:setName("Feiticos");
    obj.Feiticos:setText("Feitiços");
    obj.Feiticos:setTop(5);
    obj.Feiticos:setHorzTextAlign("center");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout28);
    obj.edit62:setField("C_FEI_Grad");
    obj.edit62:setAlign("left");
    obj.edit62:setMargins({left = 5});
    obj.edit62:setWidth(30);
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setName("edit62");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout28);
    obj.edit63:setField("C_FEI_Out");
    obj.edit63:setAlign("left");
    obj.edit63:setMargins({left = 5});
    obj.edit63:setWidth(30);
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setName("edit63");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout28);
    obj.label64:setField("INTE");
    obj.label64:setAlign("left");
    obj.label64:setMargins({left = 5});
    obj.label64:setWidth(30);
    obj.label64:setHorzTextAlign("center");
    obj.label64:setName("label64");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout28);
    obj.label65:setField("C_FEI_Total");
    obj.label65:setAlign("left");
    obj.label65:setMargins({left = 5});
    obj.label65:setWidth(30);
    obj.label65:setHorzTextAlign("center");
    obj.label65:setName("label65");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout21);
    obj.layout29:setHeight(30);
    obj.layout29:setAlign("top");
    obj.layout29:setMargins({top=3});
    obj.layout29:setName("layout29");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout29);
    obj.rectangle33:setColor("black");
    obj.rectangle33:setAlign("left");
    obj.rectangle33:setWidth(120);
    obj.rectangle33:setName("rectangle33");

    obj.Herbologia = GUI.fromHandle(_obj_newObject("label"));
    obj.Herbologia:setParent(obj.rectangle33);
    obj.Herbologia:setName("Herbologia");
    obj.Herbologia:setText("Herbologia");
    obj.Herbologia:setTop(5);
    obj.Herbologia:setHorzTextAlign("center");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout29);
    obj.edit64:setField("C_HER_Grad");
    obj.edit64:setAlign("left");
    obj.edit64:setMargins({left = 5});
    obj.edit64:setWidth(30);
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setName("edit64");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout29);
    obj.edit65:setField("C_HER_Out");
    obj.edit65:setAlign("left");
    obj.edit65:setMargins({left = 5});
    obj.edit65:setWidth(30);
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setName("edit65");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout29);
    obj.label66:setField("INTE");
    obj.label66:setAlign("left");
    obj.label66:setMargins({left = 5});
    obj.label66:setWidth(30);
    obj.label66:setHorzTextAlign("center");
    obj.label66:setName("label66");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout29);
    obj.label67:setField("C_HER_Total");
    obj.label67:setAlign("left");
    obj.label67:setMargins({left = 5});
    obj.label67:setWidth(30);
    obj.label67:setHorzTextAlign("center");
    obj.label67:setName("label67");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout21);
    obj.layout30:setHeight(30);
    obj.layout30:setAlign("top");
    obj.layout30:setMargins({top=3});
    obj.layout30:setName("layout30");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout30);
    obj.rectangle34:setColor("black");
    obj.rectangle34:setAlign("left");
    obj.rectangle34:setWidth(120);
    obj.rectangle34:setName("rectangle34");

    obj.DCAT = GUI.fromHandle(_obj_newObject("label"));
    obj.DCAT:setParent(obj.rectangle34);
    obj.DCAT:setName("DCAT");
    obj.DCAT:setText("Maldições (DCAT)");
    obj.DCAT:setTop(5);
    obj.DCAT:setHorzTextAlign("center");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout30);
    obj.edit66:setField("C_MAL_Grad");
    obj.edit66:setAlign("left");
    obj.edit66:setMargins({left = 5});
    obj.edit66:setWidth(30);
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setName("edit66");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout30);
    obj.edit67:setField("C_MAL_Out");
    obj.edit67:setAlign("left");
    obj.edit67:setMargins({left = 5});
    obj.edit67:setWidth(30);
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setName("edit67");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout30);
    obj.label68:setField("INTE");
    obj.label68:setAlign("left");
    obj.label68:setMargins({left = 5});
    obj.label68:setWidth(30);
    obj.label68:setHorzTextAlign("center");
    obj.label68:setName("label68");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout30);
    obj.label69:setField("C_MAL_Total");
    obj.label69:setAlign("left");
    obj.label69:setMargins({left = 5});
    obj.label69:setWidth(30);
    obj.label69:setHorzTextAlign("center");
    obj.label69:setName("label69");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout21);
    obj.layout31:setHeight(30);
    obj.layout31:setAlign("top");
    obj.layout31:setMargins({top=3});
    obj.layout31:setName("layout31");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout31);
    obj.rectangle35:setColor("black");
    obj.rectangle35:setAlign("left");
    obj.rectangle35:setWidth(120);
    obj.rectangle35:setName("rectangle35");

    obj.Pocoes = GUI.fromHandle(_obj_newObject("label"));
    obj.Pocoes:setParent(obj.rectangle35);
    obj.Pocoes:setName("Pocoes");
    obj.Pocoes:setText("Poções");
    obj.Pocoes:setTop(5);
    obj.Pocoes:setHorzTextAlign("center");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout31);
    obj.edit68:setField("C_POC_Grad");
    obj.edit68:setAlign("left");
    obj.edit68:setMargins({left = 5});
    obj.edit68:setWidth(30);
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setName("edit68");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout31);
    obj.edit69:setField("C_POC_Out");
    obj.edit69:setAlign("left");
    obj.edit69:setMargins({left = 5});
    obj.edit69:setWidth(30);
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setName("edit69");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout31);
    obj.label70:setField("INTE");
    obj.label70:setAlign("left");
    obj.label70:setMargins({left = 5});
    obj.label70:setWidth(30);
    obj.label70:setHorzTextAlign("center");
    obj.label70:setName("label70");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout31);
    obj.label71:setField("C_POC_Total");
    obj.label71:setAlign("left");
    obj.label71:setMargins({left = 5});
    obj.label71:setWidth(30);
    obj.label71:setHorzTextAlign("center");
    obj.label71:setName("label71");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout21);
    obj.layout32:setHeight(30);
    obj.layout32:setAlign("top");
    obj.layout32:setMargins({top=3});
    obj.layout32:setName("layout32");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout32);
    obj.rectangle36:setColor("black");
    obj.rectangle36:setAlign("left");
    obj.rectangle36:setWidth(120);
    obj.rectangle36:setName("rectangle36");

    obj.Runas = GUI.fromHandle(_obj_newObject("label"));
    obj.Runas:setParent(obj.rectangle36);
    obj.Runas:setName("Runas");
    obj.Runas:setText("Runas");
    obj.Runas:setTop(5);
    obj.Runas:setHorzTextAlign("center");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout32);
    obj.edit70:setField("C_RUN_Grad");
    obj.edit70:setAlign("left");
    obj.edit70:setMargins({left = 5});
    obj.edit70:setWidth(30);
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setName("edit70");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout32);
    obj.edit71:setField("C_RUN_Out");
    obj.edit71:setAlign("left");
    obj.edit71:setMargins({left = 5});
    obj.edit71:setWidth(30);
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setName("edit71");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout32);
    obj.label72:setField("INTE");
    obj.label72:setAlign("left");
    obj.label72:setMargins({left = 5});
    obj.label72:setWidth(30);
    obj.label72:setHorzTextAlign("center");
    obj.label72:setName("label72");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout32);
    obj.label73:setField("C_RUN_Total");
    obj.label73:setAlign("left");
    obj.label73:setMargins({left = 5});
    obj.label73:setWidth(30);
    obj.label73:setHorzTextAlign("center");
    obj.label73:setName("label73");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout21);
    obj.layout33:setHeight(30);
    obj.layout33:setAlign("top");
    obj.layout33:setMargins({top=3});
    obj.layout33:setName("layout33");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout33);
    obj.rectangle37:setColor("black");
    obj.rectangle37:setAlign("left");
    obj.rectangle37:setWidth(120);
    obj.rectangle37:setName("rectangle37");

    obj.Transmutacao = GUI.fromHandle(_obj_newObject("label"));
    obj.Transmutacao:setParent(obj.rectangle37);
    obj.Transmutacao:setName("Transmutacao");
    obj.Transmutacao:setText("Transmutação");
    obj.Transmutacao:setTop(5);
    obj.Transmutacao:setHorzTextAlign("center");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout33);
    obj.edit72:setField("C_TRA_Grad");
    obj.edit72:setAlign("left");
    obj.edit72:setMargins({left = 5});
    obj.edit72:setWidth(30);
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setName("edit72");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout33);
    obj.edit73:setField("C_TRA_Out");
    obj.edit73:setAlign("left");
    obj.edit73:setMargins({left = 5});
    obj.edit73:setWidth(30);
    obj.edit73:setHorzTextAlign("center");
    obj.edit73:setName("edit73");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout33);
    obj.label74:setField("INTE");
    obj.label74:setAlign("left");
    obj.label74:setMargins({left = 5});
    obj.label74:setWidth(30);
    obj.label74:setHorzTextAlign("center");
    obj.label74:setName("label74");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout33);
    obj.label75:setField("C_TRA_Total");
    obj.label75:setAlign("left");
    obj.label75:setMargins({left = 5});
    obj.label75:setWidth(30);
    obj.label75:setHorzTextAlign("center");
    obj.label75:setName("label75");

    obj.tabControl3 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl3:setParent(obj.layout5);
    obj.tabControl3:setAlign("left");
    obj.tabControl3:setWidth(300);
    obj.tabControl3:setName("tabControl3");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl3);
    obj.tab5:setTitle("Defesas");
    obj.tab5:setWidth(220);
    obj.tab5:setName("tab5");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.tab5);
    obj.layout34:setHeight(320);
    obj.layout34:setMargins({left=35});
    obj.layout34:setAlign("top");
    obj.layout34:setName("layout34");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout34);
    obj.label76:setAlign("top");
    obj.label76:setHeight(50);
    obj.label76:setText("Defesas Ativas");
    obj.label76:setHorzTextAlign("center");
    obj.label76:setName("label76");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout34);
    obj.layout35:setHeight(30);
    obj.layout35:setAlign("top");
    obj.layout35:setMargins({top=3});
    obj.layout35:setName("layout35");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout35);
    obj.rectangle38:setColor("black");
    obj.rectangle38:setAlign("left");
    obj.rectangle38:setWidth(120);
    obj.rectangle38:setName("rectangle38");

    obj.Iniciativa = GUI.fromHandle(_obj_newObject("label"));
    obj.Iniciativa:setParent(obj.rectangle38);
    obj.Iniciativa:setName("Iniciativa");
    obj.Iniciativa:setText("Iniciativa");
    obj.Iniciativa:setTop(5);
    obj.Iniciativa:setHorzTextAlign("center");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout35);
    obj.edit74:setField("INI_Grad");
    obj.edit74:setAlign("left");
    obj.edit74:setMargins({left = 5});
    obj.edit74:setWidth(30);
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setName("edit74");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout35);
    obj.edit75:setField("INI_Out");
    obj.edit75:setAlign("left");
    obj.edit75:setMargins({left = 5});
    obj.edit75:setWidth(30);
    obj.edit75:setHorzTextAlign("center");
    obj.edit75:setName("edit75");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout35);
    obj.label77:setField("AGI");
    obj.label77:setAlign("left");
    obj.label77:setMargins({left = 5});
    obj.label77:setWidth(30);
    obj.label77:setHorzTextAlign("center");
    obj.label77:setName("label77");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout35);
    obj.label78:setField("INI_Total");
    obj.label78:setAlign("left");
    obj.label78:setMargins({left = 5});
    obj.label78:setWidth(30);
    obj.label78:setHorzTextAlign("center");
    obj.label78:setName("label78");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout34);
    obj.layout36:setHeight(30);
    obj.layout36:setAlign("top");
    obj.layout36:setMargins({top=3});
    obj.layout36:setName("layout36");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout36);
    obj.rectangle39:setColor("black");
    obj.rectangle39:setAlign("left");
    obj.rectangle39:setWidth(120);
    obj.rectangle39:setName("rectangle39");

    obj.Aparar = GUI.fromHandle(_obj_newObject("label"));
    obj.Aparar:setParent(obj.rectangle39);
    obj.Aparar:setName("Aparar");
    obj.Aparar:setText("Aparar");
    obj.Aparar:setTop(5);
    obj.Aparar:setHorzTextAlign("center");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout36);
    obj.edit76:setField("APA_Grad");
    obj.edit76:setAlign("left");
    obj.edit76:setMargins({left = 5});
    obj.edit76:setWidth(30);
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setName("edit76");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout36);
    obj.edit77:setField("APA_Out");
    obj.edit77:setAlign("left");
    obj.edit77:setMargins({left = 5});
    obj.edit77:setWidth(30);
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setName("edit77");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout36);
    obj.label79:setField("LUT");
    obj.label79:setAlign("left");
    obj.label79:setMargins({left = 5});
    obj.label79:setWidth(30);
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout36);
    obj.label80:setField("APA_Total");
    obj.label80:setAlign("left");
    obj.label80:setMargins({left = 5});
    obj.label80:setWidth(30);
    obj.label80:setHorzTextAlign("center");
    obj.label80:setName("label80");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout34);
    obj.layout37:setHeight(30);
    obj.layout37:setAlign("top");
    obj.layout37:setMargins({top=3});
    obj.layout37:setName("layout37");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout37);
    obj.rectangle40:setColor("black");
    obj.rectangle40:setAlign("left");
    obj.rectangle40:setWidth(120);
    obj.rectangle40:setName("rectangle40");

    obj.Fortitude = GUI.fromHandle(_obj_newObject("label"));
    obj.Fortitude:setParent(obj.rectangle40);
    obj.Fortitude:setName("Fortitude");
    obj.Fortitude:setText("Fortitude");
    obj.Fortitude:setTop(5);
    obj.Fortitude:setHorzTextAlign("center");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout37);
    obj.edit78:setField("FORT_Grad");
    obj.edit78:setAlign("left");
    obj.edit78:setMargins({left = 5});
    obj.edit78:setWidth(30);
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setName("edit78");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout37);
    obj.edit79:setField("FORT_Out");
    obj.edit79:setAlign("left");
    obj.edit79:setMargins({left = 5});
    obj.edit79:setWidth(30);
    obj.edit79:setHorzTextAlign("center");
    obj.edit79:setName("edit79");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout37);
    obj.label81:setField("VIG");
    obj.label81:setAlign("left");
    obj.label81:setMargins({left = 5});
    obj.label81:setWidth(30);
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout37);
    obj.label82:setField("FORT_Total");
    obj.label82:setAlign("left");
    obj.label82:setMargins({left = 5});
    obj.label82:setWidth(30);
    obj.label82:setHorzTextAlign("center");
    obj.label82:setName("label82");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout34);
    obj.layout38:setHeight(30);
    obj.layout38:setAlign("top");
    obj.layout38:setMargins({top=3});
    obj.layout38:setName("layout38");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout38);
    obj.rectangle41:setColor("black");
    obj.rectangle41:setAlign("left");
    obj.rectangle41:setWidth(120);
    obj.rectangle41:setName("rectangle41");

    obj.Reflexo = GUI.fromHandle(_obj_newObject("label"));
    obj.Reflexo:setParent(obj.rectangle41);
    obj.Reflexo:setName("Reflexo");
    obj.Reflexo:setText("Reflexo");
    obj.Reflexo:setTop(5);
    obj.Reflexo:setHorzTextAlign("center");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout38);
    obj.edit80:setField("REF_Grad");
    obj.edit80:setAlign("left");
    obj.edit80:setMargins({left = 5});
    obj.edit80:setWidth(30);
    obj.edit80:setHorzTextAlign("center");
    obj.edit80:setName("edit80");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout38);
    obj.edit81:setField("REF_Out");
    obj.edit81:setAlign("left");
    obj.edit81:setMargins({left = 5});
    obj.edit81:setWidth(30);
    obj.edit81:setHorzTextAlign("center");
    obj.edit81:setName("edit81");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout38);
    obj.label83:setField("AGI");
    obj.label83:setAlign("left");
    obj.label83:setMargins({left = 5});
    obj.label83:setWidth(30);
    obj.label83:setHorzTextAlign("center");
    obj.label83:setName("label83");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout38);
    obj.label84:setField("REF_Total");
    obj.label84:setAlign("left");
    obj.label84:setMargins({left = 5});
    obj.label84:setWidth(30);
    obj.label84:setHorzTextAlign("center");
    obj.label84:setName("label84");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout34);
    obj.layout39:setHeight(30);
    obj.layout39:setAlign("top");
    obj.layout39:setMargins({top=3});
    obj.layout39:setName("layout39");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout39);
    obj.rectangle42:setColor("black");
    obj.rectangle42:setAlign("left");
    obj.rectangle42:setWidth(120);
    obj.rectangle42:setName("rectangle42");

    obj.Resistencia = GUI.fromHandle(_obj_newObject("label"));
    obj.Resistencia:setParent(obj.rectangle42);
    obj.Resistencia:setName("Resistencia");
    obj.Resistencia:setText("Resistencia");
    obj.Resistencia:setTop(5);
    obj.Resistencia:setHorzTextAlign("center");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout39);
    obj.edit82:setField("RES_Grad");
    obj.edit82:setAlign("left");
    obj.edit82:setMargins({left = 5});
    obj.edit82:setWidth(30);
    obj.edit82:setHorzTextAlign("center");
    obj.edit82:setName("edit82");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout39);
    obj.edit83:setField("RES_Out");
    obj.edit83:setAlign("left");
    obj.edit83:setMargins({left = 5});
    obj.edit83:setWidth(30);
    obj.edit83:setHorzTextAlign("center");
    obj.edit83:setName("edit83");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout39);
    obj.label85:setField("VIG");
    obj.label85:setAlign("left");
    obj.label85:setMargins({left = 5});
    obj.label85:setWidth(30);
    obj.label85:setHorzTextAlign("center");
    obj.label85:setName("label85");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout39);
    obj.label86:setField("RES_Total");
    obj.label86:setAlign("left");
    obj.label86:setMargins({left = 5});
    obj.label86:setWidth(30);
    obj.label86:setHorzTextAlign("center");
    obj.label86:setName("label86");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout34);
    obj.layout40:setHeight(30);
    obj.layout40:setAlign("top");
    obj.layout40:setMargins({top=3});
    obj.layout40:setName("layout40");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout40);
    obj.rectangle43:setColor("black");
    obj.rectangle43:setAlign("left");
    obj.rectangle43:setWidth(120);
    obj.rectangle43:setName("rectangle43");

    obj.Vontade = GUI.fromHandle(_obj_newObject("label"));
    obj.Vontade:setParent(obj.rectangle43);
    obj.Vontade:setName("Vontade");
    obj.Vontade:setText("Vontade");
    obj.Vontade:setTop(5);
    obj.Vontade:setHorzTextAlign("center");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout40);
    obj.edit84:setField("VON_Grad");
    obj.edit84:setAlign("left");
    obj.edit84:setMargins({left = 5});
    obj.edit84:setWidth(30);
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setName("edit84");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout40);
    obj.edit85:setField("VON_Out");
    obj.edit85:setAlign("left");
    obj.edit85:setMargins({left = 5});
    obj.edit85:setWidth(30);
    obj.edit85:setHorzTextAlign("center");
    obj.edit85:setName("edit85");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout40);
    obj.label87:setField("SAB");
    obj.label87:setAlign("left");
    obj.label87:setMargins({left = 5});
    obj.label87:setWidth(30);
    obj.label87:setHorzTextAlign("center");
    obj.label87:setName("label87");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout40);
    obj.label88:setField("VON_Total");
    obj.label88:setAlign("left");
    obj.label88:setMargins({left = 5});
    obj.label88:setWidth(30);
    obj.label88:setHorzTextAlign("center");
    obj.label88:setName("label88");

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl3);
    obj.tab6:setTitle("Defesas");
    obj.tab6:setWidth(220);
    obj.tab6:setName("tab6");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.tab6);
    obj.layout41:setHeight(320);
    obj.layout41:setMargins({left=35});
    obj.layout41:setAlign("top");
    obj.layout41:setName("layout41");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout41);
    obj.rectangle44:setName("rectangle44");
    obj.rectangle44:setAlign("top");
    obj.rectangle44:setHeight(50);

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.rectangle44);
    obj.edit86:setAlign("left");
    obj.edit86:setField("");
    obj.edit86:setMargins({left=5});
    obj.edit86:setName("edit86");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.rectangle44);
    obj.edit87:setAlign("left");
    obj.edit87:setField("");
    obj.edit87:setMargins({left=5});
    obj.edit87:setName("edit87");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.rectangle44);
    obj.edit88:setAlign("left");
    obj.edit88:setField("");
    obj.edit88:setMargins({left=5});
    obj.edit88:setName("edit88");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.rectangle44);
    obj.checkBox1:setAlign("left");
    obj.checkBox1:setWidth(30);
    obj.checkBox1:setName("checkBox1");
    obj.checkBox1:setMargins({left=10});

    obj.tab7 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl1);
    obj.tab7:setTitle("Feitiços");
    obj.tab7:setName("tab7");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.tab7);
    obj.image2:setStyle("autoFit");
    obj.image2:setTop(0);
    obj.image2:setWidth(1300);
    obj.image2:setHeight(800);
    obj.image2:setSRC("/imagens/wizard.jpg");
    obj.image2:setName("image2");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.tab7);
    obj.layout42:setAlign("top");
    obj.layout42:setHeight(100);
    obj.layout42:setPadding({top=5, left=5});
    obj.layout42:setName("layout42");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout42);
    obj.layout43:setAlign("top");
    obj.layout43:setHeight(80);
    obj.layout43:setMargins({top=10, left=0});
    obj.layout43:setName("layout43");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout43);
    obj.layout44:setAlign("left");
    obj.layout44:setMargins({left=20});
    obj.layout44:setWidth(120);
    obj.layout44:setHeight(80);
    obj.layout44:setName("layout44");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout44);
    obj.rectangle45:setTop(5);
    obj.rectangle45:setLeft(10);
    obj.rectangle45:setColor("DarkSlateBlue");
    obj.rectangle45:setWidth(90);
    obj.rectangle45:setHeight(25);
    obj.rectangle45:setName("rectangle45");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.rectangle45);
    obj.label89:setAlign("client");
    obj.label89:setText("Destreza");
    obj.label89:setHorzTextAlign("center");
    obj.label89:setName("label89");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout44);
    obj.edit89:setTop(30);
    obj.edit89:setWidth(120);
    obj.edit89:setField("DES");
    obj.edit89:setHorzTextAlign("center");
    obj.edit89:setName("edit89");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout43);
    obj.layout45:setAlign("left");
    obj.layout45:setMargins({left=20});
    obj.layout45:setWidth(120);
    obj.layout45:setHeight(80);
    obj.layout45:setName("layout45");

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout45);
    obj.rectangle46:setTop(5);
    obj.rectangle46:setLeft(10);
    obj.rectangle46:setColor("DarkSlateBlue");
    obj.rectangle46:setWidth(90);
    obj.rectangle46:setHeight(25);
    obj.rectangle46:setName("rectangle46");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.rectangle46);
    obj.label90:setAlign("client");
    obj.label90:setText("Adivinhação");
    obj.label90:setHorzTextAlign("center");
    obj.label90:setName("label90");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout45);
    obj.edit90:setTop(30);
    obj.edit90:setWidth(120);
    obj.edit90:setField("adivinhacao");
    obj.edit90:setHorzTextAlign("center");
    obj.edit90:setName("edit90");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout43);
    obj.layout46:setAlign("left");
    obj.layout46:setMargins({left=20});
    obj.layout46:setWidth(120);
    obj.layout46:setHeight(80);
    obj.layout46:setName("layout46");

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout46);
    obj.rectangle47:setTop(5);
    obj.rectangle47:setLeft(10);
    obj.rectangle47:setColor("DarkSlateBlue");
    obj.rectangle47:setWidth(90);
    obj.rectangle47:setHeight(25);
    obj.rectangle47:setName("rectangle47");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.rectangle47);
    obj.label91:setAlign("client");
    obj.label91:setText("Azaração");
    obj.label91:setHorzTextAlign("center");
    obj.label91:setName("label91");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout46);
    obj.edit91:setTop(30);
    obj.edit91:setWidth(120);
    obj.edit91:setField("azaracao");
    obj.edit91:setHorzTextAlign("center");
    obj.edit91:setName("edit91");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout43);
    obj.layout47:setAlign("left");
    obj.layout47:setMargins({left=20});
    obj.layout47:setWidth(120);
    obj.layout47:setHeight(80);
    obj.layout47:setName("layout47");

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout47);
    obj.rectangle48:setTop(5);
    obj.rectangle48:setLeft(10);
    obj.rectangle48:setColor("DarkSlateBlue");
    obj.rectangle48:setWidth(90);
    obj.rectangle48:setHeight(25);
    obj.rectangle48:setName("rectangle48");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.rectangle48);
    obj.label92:setAlign("client");
    obj.label92:setText("Contra-Feitiço");
    obj.label92:setHorzTextAlign("center");
    obj.label92:setName("label92");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout47);
    obj.edit92:setTop(30);
    obj.edit92:setWidth(120);
    obj.edit92:setField("contraFeitico");
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setName("edit92");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout43);
    obj.layout48:setAlign("left");
    obj.layout48:setMargins({left=20});
    obj.layout48:setWidth(120);
    obj.layout48:setHeight(80);
    obj.layout48:setName("layout48");

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout48);
    obj.rectangle49:setTop(5);
    obj.rectangle49:setLeft(10);
    obj.rectangle49:setColor("DarkSlateBlue");
    obj.rectangle49:setWidth(90);
    obj.rectangle49:setHeight(25);
    obj.rectangle49:setName("rectangle49");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.rectangle49);
    obj.label93:setAlign("client");
    obj.label93:setText("Encantamento");
    obj.label93:setHorzTextAlign("center");
    obj.label93:setName("label93");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout48);
    obj.edit93:setTop(30);
    obj.edit93:setWidth(120);
    obj.edit93:setField("encantamento");
    obj.edit93:setHorzTextAlign("center");
    obj.edit93:setName("edit93");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout43);
    obj.layout49:setAlign("left");
    obj.layout49:setMargins({left=20});
    obj.layout49:setWidth(120);
    obj.layout49:setHeight(80);
    obj.layout49:setName("layout49");

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout49);
    obj.rectangle50:setTop(5);
    obj.rectangle50:setLeft(10);
    obj.rectangle50:setColor("DarkSlateBlue");
    obj.rectangle50:setWidth(90);
    obj.rectangle50:setHeight(25);
    obj.rectangle50:setName("rectangle50");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.rectangle50);
    obj.label94:setAlign("client");
    obj.label94:setText("Feitiço");
    obj.label94:setHorzTextAlign("center");
    obj.label94:setName("label94");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout49);
    obj.edit94:setTop(30);
    obj.edit94:setWidth(120);
    obj.edit94:setField("feitico");
    obj.edit94:setHorzTextAlign("center");
    obj.edit94:setName("edit94");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout43);
    obj.layout50:setAlign("left");
    obj.layout50:setMargins({left=20});
    obj.layout50:setWidth(120);
    obj.layout50:setHeight(80);
    obj.layout50:setName("layout50");

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout50);
    obj.rectangle51:setTop(5);
    obj.rectangle51:setLeft(10);
    obj.rectangle51:setColor("DarkSlateBlue");
    obj.rectangle51:setWidth(90);
    obj.rectangle51:setHeight(25);
    obj.rectangle51:setName("rectangle51");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.rectangle51);
    obj.label95:setAlign("client");
    obj.label95:setText("Transmutação");
    obj.label95:setHorzTextAlign("center");
    obj.label95:setName("label95");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout50);
    obj.edit95:setTop(30);
    obj.edit95:setWidth(120);
    obj.edit95:setField("transmutacao");
    obj.edit95:setHorzTextAlign("center");
    obj.edit95:setName("edit95");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout43);
    obj.layout51:setAlign("left");
    obj.layout51:setMargins({left=20});
    obj.layout51:setWidth(120);
    obj.layout51:setHeight(80);
    obj.layout51:setName("layout51");

    obj.rectangle52 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.layout51);
    obj.rectangle52:setTop(5);
    obj.rectangle52:setLeft(10);
    obj.rectangle52:setColor("DarkSlateBlue");
    obj.rectangle52:setWidth(90);
    obj.rectangle52:setHeight(25);
    obj.rectangle52:setName("rectangle52");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.rectangle52);
    obj.label96:setAlign("client");
    obj.label96:setText("Arte das Trevas");
    obj.label96:setHorzTextAlign("center");
    obj.label96:setName("label96");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout51);
    obj.edit96:setTop(30);
    obj.edit96:setWidth(120);
    obj.edit96:setField("arteDasTrevas");
    obj.edit96:setHorzTextAlign("center");
    obj.edit96:setName("edit96");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.tab7);
    obj.layout52:setAlign("top");
    obj.layout52:setHeight(80);
    obj.layout52:setMargins({top=0, left=0});
    obj.layout52:setName("layout52");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout52);
    obj.layout53:setAlign("left");
    obj.layout53:setMargins({left=20});
    obj.layout53:setWidth(120);
    obj.layout53:setHeight(80);
    obj.layout53:setName("layout53");

    obj.rectangle53 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout53);
    obj.rectangle53:setTop(5);
    obj.rectangle53:setLeft(10);
    obj.rectangle53:setColor("#6B8E23");
    obj.rectangle53:setWidth(90);
    obj.rectangle53:setHeight(25);
    obj.rectangle53:setName("rectangle53");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.rectangle53);
    obj.label97:setAlign("client");
    obj.label97:setText("Fisico");
    obj.label97:setHorzTextAlign("center");
    obj.label97:setName("label97");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout53);
    obj.edit97:setTop(30);
    obj.edit97:setWidth(120);
    obj.edit97:setField("fisico");
    obj.edit97:setHorzTextAlign("center");
    obj.edit97:setName("edit97");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout52);
    obj.layout54:setAlign("left");
    obj.layout54:setMargins({left=20});
    obj.layout54:setWidth(120);
    obj.layout54:setHeight(80);
    obj.layout54:setName("layout54");

    obj.rectangle54 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.layout54);
    obj.rectangle54:setTop(5);
    obj.rectangle54:setLeft(10);
    obj.rectangle54:setColor("#6B8E23");
    obj.rectangle54:setWidth(90);
    obj.rectangle54:setHeight(25);
    obj.rectangle54:setName("rectangle54");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.rectangle54);
    obj.label98:setAlign("client");
    obj.label98:setText("Mental");
    obj.label98:setHorzTextAlign("center");
    obj.label98:setName("label98");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout54);
    obj.edit98:setTop(30);
    obj.edit98:setWidth(120);
    obj.edit98:setField("mental");
    obj.edit98:setHorzTextAlign("center");
    obj.edit98:setName("edit98");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.layout52);
    obj.layout55:setAlign("left");
    obj.layout55:setMargins({left=20});
    obj.layout55:setWidth(120);
    obj.layout55:setHeight(80);
    obj.layout55:setName("layout55");

    obj.rectangle55 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.layout55);
    obj.rectangle55:setTop(5);
    obj.rectangle55:setLeft(10);
    obj.rectangle55:setColor("purple");
    obj.rectangle55:setWidth(90);
    obj.rectangle55:setHeight(25);
    obj.rectangle55:setName("rectangle55");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.rectangle55);
    obj.label99:setAlign("client");
    obj.label99:setText("Concentração");
    obj.label99:setHorzTextAlign("center");
    obj.label99:setName("label99");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout55);
    obj.edit99:setTop(30);
    obj.edit99:setWidth(120);
    obj.edit99:setField("concentracao");
    obj.edit99:setHorzTextAlign("center");
    obj.edit99:setName("edit99");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.layout52);
    obj.layout56:setAlign("left");
    obj.layout56:setMargins({left=20});
    obj.layout56:setWidth(120);
    obj.layout56:setHeight(80);
    obj.layout56:setName("layout56");

    obj.rectangle56 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.layout56);
    obj.rectangle56:setTop(5);
    obj.rectangle56:setLeft(10);
    obj.rectangle56:setColor("purple");
    obj.rectangle56:setWidth(90);
    obj.rectangle56:setHeight(25);
    obj.rectangle56:setName("rectangle56");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.rectangle56);
    obj.label100:setAlign("client");
    obj.label100:setText("Acerto");
    obj.label100:setHorzTextAlign("center");
    obj.label100:setName("label100");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout56);
    obj.edit100:setTop(30);
    obj.edit100:setWidth(120);
    obj.edit100:setField("acerto");
    obj.edit100:setHorzTextAlign("center");
    obj.edit100:setName("edit100");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.tab7);
    obj.layout57:setAlign("top");
    obj.layout57:setHeight(600);
    obj.layout57:setPadding({top=5, left=5});
    obj.layout57:setName("layout57");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout57);
    obj.button1:setLeft(20);
    obj.button1:setTop(20);
    obj.button1:setHeight(25);
    obj.button1:setText("Novo Feitiço");
    obj.button1:setWidth(100);
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout57);
    obj.button2:setLeft(130);
    obj.button2:setTop(20);
    obj.button2:setHeight(25);
    obj.button2:setText("Ordenar");
    obj.button2:setWidth(100);
    obj.button2:setName("button2");

    obj.rclMagias = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMagias:setParent(obj.layout57);
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

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.ACR_Total = (tonumber(sheet.ACR_Grad) or 0) +
                           (tonumber(sheet.AGI) or 0) +
                           (tonumber(sheet.ACR_Out) or 0)
                           sheet.ATL_Total = (tonumber(sheet.ATL_Grad) or 0) +
                           (tonumber(sheet.FOR) or 0) +
                           (tonumber(sheet.ATL_Out) or 0)
                           sheet.COR_Total = (tonumber(sheet.COR_Grad) or 0) +
                           (tonumber(sheet.LUT) or 0) +
                           (tonumber(sheet.COR_Out) or 0)
                           sheet.FUR_Total = (tonumber(sheet.FUR_Grad) or 0) +
                           (tonumber(sheet.AGI) or 0) +
                           (tonumber(sheet.FUR_Out) or 0)
                           sheet.PRE_Total = (tonumber(sheet.PRE_Grad) or 0) +
                           (tonumber(sheet.DES) or 0) +
                           (tonumber(sheet.PRE_Out) or 0)
                           sheet.VEI_Total = (tonumber(sheet.VEI_Grad) or 0) +
                           (tonumber(sheet.AGI) or 0) +
                           (tonumber(sheet.VEI_Out) or 0)
                           sheet.CON_Total = (tonumber(sheet.CON_Grad) or 0) +
                           (tonumber(sheet.SAB) or 0) +
                           (tonumber(sheet.CON_Out) or 0)
                           sheet.ENG_Total = (tonumber(sheet.ENG_Grad) or 0) +
                           (tonumber(sheet.PRE) or 0) +
                           (tonumber(sheet.ENG_Out) or 0)
                           sheet.INT_Total = (tonumber(sheet.INT_Grad) or 0) +
                           (tonumber(sheet.PRE) or 0) +
                           (tonumber(sheet.INT_Out) or 0)
                           sheet.INTU_Total = (tonumber(sheet.INTU_Grad) or 0) +
                           (tonumber(sheet.SAB) or 0) +
                           (tonumber(sheet.INTU_Out) or 0)
                           sheet.PERC_Total = (tonumber(sheet.PERC_Grad) or 0) +
                           (tonumber(sheet.SAB) or 0) +
                           (tonumber(sheet.PERC_Out) or 0)
                           sheet.PERS_Total = (tonumber(sheet.PERS_Grad) or 0) +
                           (tonumber(sheet.PRE) or 0) +
                           (tonumber(sheet.PERS_Out) or 0)
                           sheet.TRA_Total = (tonumber(sheet.TRA_Grad) or 0) +
                           (tonumber(sheet.INTE) or 0) +
                           (tonumber(sheet.TRA_Out) or 0)
                           sheet.ATU_Total = (tonumber(sheet.ATU_Grad) or 0) +
                           (tonumber(sheet.INTE) or 0) +
                           (tonumber(sheet.ATU_Out) or 0)
                           sheet.C_ADI_Total = (tonumber(sheet.C_ADI_Grad) or 0) +
                           (tonumber(sheet.INTE) or 0) +
                           (tonumber(sheet.C_ADI_Out) or 0)
                           sheet.C_AZA_Total = (tonumber(sheet.C_AZA_Grad) or 0) +
                           (tonumber(sheet.INTE) or 0) +
                           (tonumber(sheet.C_AZA_Out) or 0)
                           sheet.C_CON_Total = (tonumber(sheet.C_CON_Grad) or 0) +
                           (tonumber(sheet.INTE) or 0) +
                           (tonumber(sheet.C_CON_Out) or 0)
                           sheet.C_CRI_Total = (tonumber(sheet.C_CRI_Grad) or 0) +
                           (tonumber(sheet.INTE) or 0) +
                           (tonumber(sheet.C_CRI_Out) or 0)
                           sheet.C_ENC_Total = (tonumber(sheet.C_ENC_Grad) or 0) +
                           (tonumber(sheet.INTE) or 0) +
                           (tonumber(sheet.C_ENC_Out) or 0)
                           sheet.C_FEI_Total = (tonumber(sheet.C_FEI_Grad) or 0) +
                           (tonumber(sheet.INTE) or 0) +
                           (tonumber(sheet.C_FEI_Out) or 0)
                           sheet.C_HER_Total = (tonumber(sheet.C_HER_Grad) or 0) +
                           (tonumber(sheet.INTE) or 0) +
                           (tonumber(sheet.C_HER_Out) or 0)
                           sheet.C_MAL_Total = (tonumber(sheet.C_MAL_Grad) or 0) +
                           (tonumber(sheet.INTE) or 0) +
                           (tonumber(sheet.C_MAL_Out) or 0)
                           sheet.C_POC_Total = (tonumber(sheet.C_POC_Grad) or 0) +
                           (tonumber(sheet.INTE) or 0) +
                           (tonumber(sheet.C_POC_Out) or 0)
                           sheet.C_RUN_Total = (tonumber(sheet.C_RUN_Grad) or 0) +
                           (tonumber(sheet.INTE) or 0) +
                           (tonumber(sheet.C_RUN_Out) or 0)
                           sheet.C_TRA_Total = (tonumber(sheet.C_TRA_Grad) or 0) +
                           (tonumber(sheet.INTE) or 0) +
                           (tonumber(sheet.C_TRA_Out) or 0)
        end, obj);

    obj._e_event2 = obj.rectangle13:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.ACR_Total or 0),
                                self.Acrobacia.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event3 = obj.rectangle14:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.ATL_Total or 0),
                                self.Atlestismo.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event4 = obj.rectangle15:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.COR_Total or 0),
                                self.CorpoACorpo.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event5 = obj.rectangle16:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.FUR_Total or 0),
                                self.Furtividade.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event6 = obj.rectangle17:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.PRE_Total or 0),
                                self.Prestidigitacao.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event7 = obj.rectangle18:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.VEI_Total or 0),
                                self.VeiculosMagicos.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event8 = obj.rectangle19:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.CON_Total or 0),
                                self.Concentracao.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event9 = obj.rectangle20:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.ENG_Total or 0),
                                self.Enganacao.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event10 = obj.rectangle21:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.INT_Total or 0),
                                self.Intimidacao.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event11 = obj.rectangle22:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.INTU_Total or 0),
                                self.Intuicao.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event12 = obj.rectangle23:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.PERC_Total or 0),
                                self.Percepcao.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event13 = obj.rectangle24:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.PERS_Total or 0),
                                self.Persuacao.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event14 = obj.rectangle25:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.TRA_Total or 0),
                                self.Tratamento.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event15 = obj.rectangle26:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.ATU_Total or 0),
                                self.Atualidades.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event16 = obj.rectangle27:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.C_ADI_Total or 0),
                                self.Adivinhacao.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event17 = obj.rectangle28:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.C_AZA_Total or 0),
                                self.Azaracao.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event18 = obj.rectangle29:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.C_CON_Total or 0),
                                self.ContraFeitico.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event19 = obj.rectangle30:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.C_CRI_Total or 0),
                                self.CriaturasMagicas.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event20 = obj.rectangle31:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.C_ENC_Total or 0),
                                self.Encantamentos.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event21 = obj.rectangle32:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.C_FEI_Total or 0),
                                self.Feiticos.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event22 = obj.rectangle33:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.C_HER_Total or 0),
                                self.Herbologia.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event23 = obj.rectangle34:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.C_MAL_Total or 0),
                                self.DCAT.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event24 = obj.rectangle35:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.C_POC_Total or 0),
                                self.Pocoes.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event25 = obj.rectangle36:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.C_RUN_Total or 0),
                                self.Runas.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event26 = obj.rectangle37:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.C_TRA_Total or 0),
                                self.Transmutacao.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event27 = obj.rectangle38:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.INI_Total or 0),
                                self.Iniciativa.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event28 = obj.rectangle39:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.APA_Total or 0),
                                self.Aparar.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event29 = obj.rectangle40:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.FORT_Total or 0),
                                self.Fortitude.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event30 = obj.rectangle41:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.REF_Total or 0),
                                self.Reflexo.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event31 = obj.rectangle42:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.RES_Total or 0),
                                self.Resistencia.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event32 = obj.rectangle43:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
            
            
                                chat:rolarDados("1d20 + " .. (sheet.VON_Total or 0),
                                self.Vontade.text,
                                function (rolado)
            
                                end);
        end, obj);

    obj._e_event33 = obj.edit89:addEventListener("onUserChange",
        function (_)
        end, obj);

    obj._e_event34 = obj.edit90:addEventListener("onUserChange",
        function (_)
        end, obj);

    obj._e_event35 = obj.edit91:addEventListener("onUserChange",
        function (_)
        end, obj);

    obj._e_event36 = obj.edit92:addEventListener("onUserChange",
        function (_)
        end, obj);

    obj._e_event37 = obj.edit93:addEventListener("onUserChange",
        function (_)
        end, obj);

    obj._e_event38 = obj.edit94:addEventListener("onUserChange",
        function (_)
        end, obj);

    obj._e_event39 = obj.edit95:addEventListener("onUserChange",
        function (_)
        end, obj);

    obj._e_event40 = obj.edit96:addEventListener("onUserChange",
        function (_)
        end, obj);

    obj._e_event41 = obj.edit97:addEventListener("onUserChange",
        function (_)
            local minhaMesa = Firecast.getRoomOf(sheet);
                                    local chat = minhaMesa.chat;
            
                                    chat:enviarAcao("esta com penalidade em Fisico de " ..
                                    sheet.fisico)
        end, obj);

    obj._e_event42 = obj.edit98:addEventListener("onUserChange",
        function (_)
            local minhaMesa = Firecast.getRoomOf(sheet);
                                    local chat = minhaMesa.chat;
            
                                    chat:enviarAcao("esta com penalidade em Mental de " ..
                                    sheet.mental)
        end, obj);

    obj._e_event43 = obj.edit99:addEventListener("onUserChange",
        function (_)
        end, obj);

    obj._e_event44 = obj.edit100:addEventListener("onUserChange",
        function (_)
        end, obj);

    obj._e_event45 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclMagias:append();
        end, obj);

    obj._e_event46 = obj.button2:addEventListener("onClick",
        function (_)
            self.rclMagias:sort();
        end, obj);

    obj._e_event47 = obj.rclMagias:addEventListener("onCompare",
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
        __o_rrpgObjs.removeEventListenerById(self._e_event47);
        __o_rrpgObjs.removeEventListenerById(self._e_event46);
        __o_rrpgObjs.removeEventListenerById(self._e_event45);
        __o_rrpgObjs.removeEventListenerById(self._e_event44);
        __o_rrpgObjs.removeEventListenerById(self._e_event43);
        __o_rrpgObjs.removeEventListenerById(self._e_event42);
        __o_rrpgObjs.removeEventListenerById(self._e_event41);
        __o_rrpgObjs.removeEventListenerById(self._e_event40);
        __o_rrpgObjs.removeEventListenerById(self._e_event39);
        __o_rrpgObjs.removeEventListenerById(self._e_event38);
        __o_rrpgObjs.removeEventListenerById(self._e_event37);
        __o_rrpgObjs.removeEventListenerById(self._e_event36);
        __o_rrpgObjs.removeEventListenerById(self._e_event35);
        __o_rrpgObjs.removeEventListenerById(self._e_event34);
        __o_rrpgObjs.removeEventListenerById(self._e_event33);
        __o_rrpgObjs.removeEventListenerById(self._e_event32);
        __o_rrpgObjs.removeEventListenerById(self._e_event31);
        __o_rrpgObjs.removeEventListenerById(self._e_event30);
        __o_rrpgObjs.removeEventListenerById(self._e_event29);
        __o_rrpgObjs.removeEventListenerById(self._e_event28);
        __o_rrpgObjs.removeEventListenerById(self._e_event27);
        __o_rrpgObjs.removeEventListenerById(self._e_event26);
        __o_rrpgObjs.removeEventListenerById(self._e_event25);
        __o_rrpgObjs.removeEventListenerById(self._e_event24);
        __o_rrpgObjs.removeEventListenerById(self._e_event23);
        __o_rrpgObjs.removeEventListenerById(self._e_event22);
        __o_rrpgObjs.removeEventListenerById(self._e_event21);
        __o_rrpgObjs.removeEventListenerById(self._e_event20);
        __o_rrpgObjs.removeEventListenerById(self._e_event19);
        __o_rrpgObjs.removeEventListenerById(self._e_event18);
        __o_rrpgObjs.removeEventListenerById(self._e_event17);
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
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
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.Intuicao ~= nil then self.Intuicao:destroy(); self.Intuicao = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.Enganacao ~= nil then self.Enganacao:destroy(); self.Enganacao = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.Atualidades ~= nil then self.Atualidades:destroy(); self.Atualidades = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.Runas ~= nil then self.Runas:destroy(); self.Runas = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.VeiculosMagicos ~= nil then self.VeiculosMagicos:destroy(); self.VeiculosMagicos = nil; end;
        if self.Concentracao ~= nil then self.Concentracao:destroy(); self.Concentracao = nil; end;
        if self.Resistencia ~= nil then self.Resistencia:destroy(); self.Resistencia = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.Furtividade ~= nil then self.Furtividade:destroy(); self.Furtividade = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.DCAT ~= nil then self.DCAT:destroy(); self.DCAT = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.Fortitude ~= nil then self.Fortitude:destroy(); self.Fortitude = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.Feiticos ~= nil then self.Feiticos:destroy(); self.Feiticos = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.Atlestismo ~= nil then self.Atlestismo:destroy(); self.Atlestismo = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
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
        if self.Intimidacao ~= nil then self.Intimidacao:destroy(); self.Intimidacao = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.Adivinhacao ~= nil then self.Adivinhacao:destroy(); self.Adivinhacao = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.rclMagias ~= nil then self.rclMagias:destroy(); self.rclMagias = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.Prestidigitacao ~= nil then self.Prestidigitacao:destroy(); self.Prestidigitacao = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.Transmutacao ~= nil then self.Transmutacao:destroy(); self.Transmutacao = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.Reflexo ~= nil then self.Reflexo:destroy(); self.Reflexo = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.Persuacao ~= nil then self.Persuacao:destroy(); self.Persuacao = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.Iniciativa ~= nil then self.Iniciativa:destroy(); self.Iniciativa = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.Percepcao ~= nil then self.Percepcao:destroy(); self.Percepcao = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.Aparar ~= nil then self.Aparar:destroy(); self.Aparar = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.Acrobacia ~= nil then self.Acrobacia:destroy(); self.Acrobacia = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.tabControl3 ~= nil then self.tabControl3:destroy(); self.tabControl3 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.CorpoACorpo ~= nil then self.CorpoACorpo:destroy(); self.CorpoACorpo = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.Vontade ~= nil then self.Vontade:destroy(); self.Vontade = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.Encantamentos ~= nil then self.Encantamentos:destroy(); self.Encantamentos = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.Tratamento ~= nil then self.Tratamento:destroy(); self.Tratamento = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.tabControl2 ~= nil then self.tabControl2:destroy(); self.tabControl2 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.Herbologia ~= nil then self.Herbologia:destroy(); self.Herbologia = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.Azaracao ~= nil then self.Azaracao:destroy(); self.Azaracao = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.CriaturasMagicas ~= nil then self.CriaturasMagicas:destroy(); self.CriaturasMagicas = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.Pocoes ~= nil then self.Pocoes:destroy(); self.Pocoes = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.ContraFeitico ~= nil then self.ContraFeitico:destroy(); self.ContraFeitico = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
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
