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

    rawset(obj, "_oldSetNodeObjectFunction", obj.setNodeObject);

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
    obj:setHeight(550);
    obj:setWidth(1080);
    obj:setTitle("Ficha Harry Potter Nova!");
    obj:setName("HarryFicha");


          local function TotalPericia(ATR, MOD, OUT)
          local total = 0

          total = ATR + MOD + OUT

          return total
          end

     



          local function cadaDez(numero)
               local result = -1

               while numero >= 0 do
                    result = result + 1
                    numero = numero - 10
               end

               return result
          end
     




     


    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'AGI','DES', 'FOR','LUT','VIG','INTE','PRE','SAB','ACR_Grad','ACR_Out','ATL_Grad',
          'ATL_Out','COR_Grad','COR_Out','ENG_Grad', 'ENG_Out','FUR_Grad','FUR_Out','PRE_Grad','PRE_Out','VEI_Grad','VEI_Out',
          'CON_Grad','CON_Out','INT_Grad','INT_Out','INTU_Grad','INTU_Out','INV_Grad','INV_Out','PERC_Grad','PERC_Out','PERS_Grad','PERS_Out',
          'TRA_Grad','TRA_Out','ATU_Grad','ATU_Out','C_ADI_Grad','C_ADI_Out','C_AZA_Grad','C_AZA_Out','C_CON_Grad','C_CON_Out',
          'C_CRI_Grad','C_CRI_Out','C_ENC_Grad','C_ENC_Out','C_FEI_Grad','C_FEI_Out','C_HER_Grad','C_HER_Out','C_MAL_Grad','C_MAL_Out','C_POC_Grad','C_POC_Out',
          'C_RUN_Grad','C_RUN_Out','C_TRA_Grad','C_TRA_Out', 'INI_Grad', 'INI_Out', 'APA_Grad','APA_Out', 'FORT_Grad', 'FORT_Out',
          'REF_Grad', 'REF_Out', 'RES_Grad', 'RES_Out', 'VON_Grad', 'VON_Out', 'ANTE_QUAD_OUT', 'APAN_QUAD_OUT', 'ATRA_QUAD_OUT', 'DRI_QUAD_OUT', 'GOL_QUAD_OUT',
          'FALTA_QUAD_OUT', 'PASS_QUAD_OUT', 'REBA_QUAD_OUT', 'ROU_QUAD_OUT' , 'VEL_QUAD_OUT', 'DEFE_QUAD_GRAD' , 'DEFE_QUAD_OUT' });
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

    obj.form1 = GUI.fromHandle(_obj_newObject("form"));
    obj.form1:setParent(obj.scrollBox1);
    obj.form1:setName("form1");

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

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
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

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle2);
    obj.label4:setLeft(5);
    obj.label4:setTop(35);
    obj.label4:setText("Nome Personagem");
    obj.label4:setWidth(110);
    obj.label4:setHeight(25);
    obj.label4:setName("label4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle2);
    obj.label5:setLeft(5);
    obj.label5:setTop(65);
    obj.label5:setText("Casa");
    obj.label5:setWidth(90);
    obj.label5:setHeight(25);
    obj.label5:setName("label5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle2);
    obj.label6:setLeft(5);
    obj.label6:setTop(95);
    obj.label6:setText("Continente");
    obj.label6:setWidth(90);
    obj.label6:setHeight(25);
    obj.label6:setName("label6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle2);
    obj.label7:setLeft(5);
    obj.label7:setTop(125);
    obj.label7:setText("Classe");
    obj.label7:setWidth(90);
    obj.label7:setHeight(25);
    obj.label7:setName("label7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle2);
    obj.label8:setLeft(130);
    obj.label8:setTop(125);
    obj.label8:setText("Level");
    obj.label8:setWidth(90);
    obj.label8:setHeight(25);
    obj.label8:setName("label8");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle2);
    obj.label9:setLeft(222);
    obj.label9:setTop(125);
    obj.label9:setText("XP");
    obj.label9:setWidth(90);
    obj.label9:setHeight(25);
    obj.label9:setName("label9");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle2);
    obj.edit1:setField("nomeJogador");
    obj.edit1:setLeft(100);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(245);
    obj.edit1:setHeight(25);
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle2);
    obj.edit2:setField("nomePersonagem");
    obj.edit2:setLeft(120);
    obj.edit2:setTop(35);
    obj.edit2:setWidth(225);
    obj.edit2:setHeight(25);
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle2);
    obj.edit3:setField("casa");
    obj.edit3:setLeft(52);
    obj.edit3:setTop(65);
    obj.edit3:setWidth(293);
    obj.edit3:setHeight(25);
    obj.edit3:setName("edit3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle2);
    obj.edit4:setField("continente");
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

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.rectangle2);
    obj.rectangle3:setLeft(355);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(80);
    obj.rectangle3:setHeight(155);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setName("rectangle3");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.rectangle3);
    obj.rectangle4:setHeight(35);
    obj.rectangle4:setAlign("top");
    obj.rectangle4:setMargins({top=3});
    obj.rectangle4:setColor("#0000FF4D");
    obj.rectangle4:setName("rectangle4");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.rectangle4);
    obj.checkBox1:setAlign("left");
    obj.checkBox1:setWidth(20);
    obj.checkBox1:setText("Caixa de marcação");
    obj.checkBox1:setField("Fadigado");
    obj.checkBox1:setName("checkBox1");

    obj.Fadigado = GUI.fromHandle(_obj_newObject("label"));
    obj.Fadigado:setParent(obj.rectangle4);
    obj.Fadigado:setName("Fadigado");
    obj.Fadigado:setAlign("left");
    obj.Fadigado:setWidth(80);
    obj.Fadigado:setText("Fadigado");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.rectangle3);
    obj.rectangle5:setHeight(35);
    obj.rectangle5:setAlign("top");
    obj.rectangle5:setMargins({top=3});
    obj.rectangle5:setColor("#0000FF4D");
    obj.rectangle5:setName("rectangle5");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.rectangle5);
    obj.checkBox2:setAlign("left");
    obj.checkBox2:setWidth(20);
    obj.checkBox2:setText("Caixa de marcação");
    obj.checkBox2:setField("Exausto");
    obj.checkBox2:setName("checkBox2");

    obj.Exausto = GUI.fromHandle(_obj_newObject("label"));
    obj.Exausto:setParent(obj.rectangle5);
    obj.Exausto:setName("Exausto");
    obj.Exausto:setAlign("left");
    obj.Exausto:setWidth(80);
    obj.Exausto:setText("Exausto");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.rectangle3);
    obj.rectangle6:setHeight(35);
    obj.rectangle6:setAlign("top");
    obj.rectangle6:setMargins({top=3});
    obj.rectangle6:setColor("#00FF004D");
    obj.rectangle6:setName("rectangle6");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.rectangle6);
    obj.checkBox3:setAlign("left");
    obj.checkBox3:setWidth(20);
    obj.checkBox3:setText("Caixa de marcação");
    obj.checkBox3:setField("Frustrado");
    obj.checkBox3:setName("checkBox3");

    obj.Frustrado = GUI.fromHandle(_obj_newObject("label"));
    obj.Frustrado:setParent(obj.rectangle6);
    obj.Frustrado:setName("Frustrado");
    obj.Frustrado:setAlign("left");
    obj.Frustrado:setWidth(80);
    obj.Frustrado:setText("Frustrado");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.rectangle3);
    obj.rectangle7:setHeight(35);
    obj.rectangle7:setAlign("top");
    obj.rectangle7:setMargins({top=3});
    obj.rectangle7:setColor("#00FF004D");
    obj.rectangle7:setName("rectangle7");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.rectangle7);
    obj.checkBox4:setAlign("left");
    obj.checkBox4:setWidth(20);
    obj.checkBox4:setText("Caixa de marcação");
    obj.checkBox4:setField("Tiltado");
    obj.checkBox4:setName("checkBox4");

    obj.Tiltado = GUI.fromHandle(_obj_newObject("label"));
    obj.Tiltado:setParent(obj.rectangle7);
    obj.Tiltado:setName("Tiltado");
    obj.Tiltado:setAlign("left");
    obj.Tiltado:setWidth(80);
    obj.Tiltado:setText("Tiltado");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.rectangle2);
    obj.rectangle8:setLeft(450);
    obj.rectangle8:setTop(0);
    obj.rectangle8:setWidth(80);
    obj.rectangle8:setHeight(155);
    obj.rectangle8:setMargins({top=3});
    obj.rectangle8:setColor("yellow");
    obj.rectangle8:setName("rectangle8");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle8);
    obj.label10:setField("pontosAtributos");
    obj.label10:setFontColor("black");
    obj.label10:setAlign("top");
    obj.label10:setHeight(35);
    obj.label10:setName("label10");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle8);
    obj.label11:setField("pontosPericias");
    obj.label11:setAlign("top");
    obj.label11:setFontColor("black");
    obj.label11:setHeight(35);
    obj.label11:setName("label11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle8);
    obj.label12:setField("pontosDefesas");
    obj.label12:setAlign("top");
    obj.label12:setFontColor("black");
    obj.label12:setHeight(35);
    obj.label12:setName("label12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle8);
    obj.label13:setField("pontosFeiticos");
    obj.label13:setAlign("top");
    obj.label13:setFontColor("black");
    obj.label13:setHeight(35);
    obj.label13:setName("label13");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.rectangle2);
    obj.rectangle9:setLeft(590);
    obj.rectangle9:setTop(0);
    obj.rectangle9:setWidth(80);
    obj.rectangle9:setHeight(155);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setName("rectangle9");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle9);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(100);
    obj.layout2:setName("layout2");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout2);
    obj.label14:setAlign("top");
    obj.label14:setHeight(35);
    obj.label14:setMargins({top=5});
    obj.label14:setField("update");
    obj.label14:setName("label14");

    obj.version = GUI.fromHandle(_obj_newObject("label"));
    obj.version:setParent(obj.layout2);
    obj.version:setName("version");
    obj.version:setAlign("top");
    obj.version:setHeight(35);
    obj.version:setMargins({top=5});
    obj.version:setText("Harry 3.5");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(0);
    obj.layout3:setTop(220);
    obj.layout3:setWidth(200);
    obj.layout3:setHeight(500);
    obj.layout3:setName("layout3");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout3);
    obj.rectangle10:setAlign("top");
    obj.rectangle10:setHeight(40);
    obj.rectangle10:setColor("#1F2328");
    obj.rectangle10:setName("rectangle10");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.rectangle10);
    obj.label15:setMargins({left=5});
    obj.label15:setHorzTextAlign("center");
    obj.label15:setAlign("left");
    obj.label15:setWidth(100);
    obj.label15:setText("CORPO");
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectangle10);
    obj.label16:setMargins({left=5});
    obj.label16:setHorzTextAlign("center");
    obj.label16:setAlign("left");
    obj.label16:setWidth(40);
    obj.label16:setText("MOD");
    obj.label16:setName("label16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.rectangle10);
    obj.label17:setMargins({left=5});
    obj.label17:setHorzTextAlign("center");
    obj.label17:setAlign("left");
    obj.label17:setWidth(40);
    obj.label17:setText("OUT");
    obj.label17:setName("label17");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout3);
    obj.rectangle11:setPadding({top=3,bottom=5});
    obj.rectangle11:setAlign("top");
    obj.rectangle11:setHeight(35);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setName("rectangle11");

    obj.AGILIDADE = GUI.fromHandle(_obj_newObject("label"));
    obj.AGILIDADE:setParent(obj.rectangle11);
    obj.AGILIDADE:setMargins({left=5});
    obj.AGILIDADE:setAlign("left");
    obj.AGILIDADE:setHorzTextAlign("center");
    obj.AGILIDADE:setWidth(100);
    obj.AGILIDADE:setText("AGILIDADE");
    obj.AGILIDADE:setName("AGILIDADE");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle11);
    obj.edit8:setMargins({left=5});
    obj.edit8:setAlign("left");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setWidth(40);
    obj.edit8:setField("AGI");
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle11);
    obj.edit9:setMargins({left=5});
    obj.edit9:setAlign("left");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setWidth(40);
    obj.edit9:setField("AGI_OUT");
    obj.edit9:setName("edit9");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout3);
    obj.rectangle12:setPadding({top=3,bottom=5});
    obj.rectangle12:setAlign("top");
    obj.rectangle12:setHeight(35);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setName("rectangle12");

    obj.DESTREZA = GUI.fromHandle(_obj_newObject("label"));
    obj.DESTREZA:setParent(obj.rectangle12);
    obj.DESTREZA:setMargins({left=5});
    obj.DESTREZA:setAlign("left");
    obj.DESTREZA:setHorzTextAlign("center");
    obj.DESTREZA:setWidth(100);
    obj.DESTREZA:setText("DESTREZA");
    obj.DESTREZA:setName("DESTREZA");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle12);
    obj.edit10:setMargins({left=5});
    obj.edit10:setAlign("left");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setWidth(40);
    obj.edit10:setField("DES");
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectangle12);
    obj.edit11:setMargins({left=5});
    obj.edit11:setAlign("left");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setWidth(40);
    obj.edit11:setField("DES_OUT");
    obj.edit11:setName("edit11");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout3);
    obj.rectangle13:setPadding({top=3,bottom=5});
    obj.rectangle13:setAlign("top");
    obj.rectangle13:setHeight(35);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setName("rectangle13");

    obj.FORCA = GUI.fromHandle(_obj_newObject("label"));
    obj.FORCA:setParent(obj.rectangle13);
    obj.FORCA:setMargins({left=5});
    obj.FORCA:setAlign("left");
    obj.FORCA:setHorzTextAlign("center");
    obj.FORCA:setWidth(100);
    obj.FORCA:setText("FORÇA");
    obj.FORCA:setName("FORCA");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.rectangle13);
    obj.edit12:setMargins({left=5});
    obj.edit12:setAlign("left");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setWidth(40);
    obj.edit12:setField("FOR");
    obj.edit12:setName("edit12");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.rectangle13);
    obj.edit13:setMargins({left=5});
    obj.edit13:setAlign("left");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setWidth(40);
    obj.edit13:setField("FOR_OUT");
    obj.edit13:setName("edit13");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout3);
    obj.rectangle14:setPadding({top=3,bottom=5});
    obj.rectangle14:setAlign("top");
    obj.rectangle14:setHeight(35);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setName("rectangle14");

    obj.LUTA = GUI.fromHandle(_obj_newObject("label"));
    obj.LUTA:setParent(obj.rectangle14);
    obj.LUTA:setMargins({left=5});
    obj.LUTA:setAlign("left");
    obj.LUTA:setHorzTextAlign("center");
    obj.LUTA:setWidth(100);
    obj.LUTA:setText("LUTA");
    obj.LUTA:setName("LUTA");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.rectangle14);
    obj.edit14:setMargins({left=5});
    obj.edit14:setAlign("left");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setWidth(40);
    obj.edit14:setField("LUT");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.rectangle14);
    obj.edit15:setMargins({left=5});
    obj.edit15:setAlign("left");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setWidth(40);
    obj.edit15:setField("LUT_OUT");
    obj.edit15:setName("edit15");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout3);
    obj.rectangle15:setPadding({top=3,bottom=5});
    obj.rectangle15:setAlign("top");
    obj.rectangle15:setHeight(35);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setName("rectangle15");

    obj.VIGOR = GUI.fromHandle(_obj_newObject("label"));
    obj.VIGOR:setParent(obj.rectangle15);
    obj.VIGOR:setMargins({left=5});
    obj.VIGOR:setAlign("left");
    obj.VIGOR:setHorzTextAlign("center");
    obj.VIGOR:setWidth(100);
    obj.VIGOR:setText("VIGOR");
    obj.VIGOR:setName("VIGOR");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.rectangle15);
    obj.edit16:setMargins({left=5});
    obj.edit16:setAlign("left");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setWidth(40);
    obj.edit16:setField("VIG");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.rectangle15);
    obj.edit17:setMargins({left=5});
    obj.edit17:setAlign("left");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setWidth(40);
    obj.edit17:setField("VIG_OUT");
    obj.edit17:setName("edit17");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout3);
    obj.rectangle16:setAlign("top");
    obj.rectangle16:setMargins({top=15});
    obj.rectangle16:setHeight(40);
    obj.rectangle16:setColor("#1F2328");
    obj.rectangle16:setName("rectangle16");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.rectangle16);
    obj.label18:setMargins({left=5});
    obj.label18:setHorzTextAlign("center");
    obj.label18:setAlign("left");
    obj.label18:setWidth(100);
    obj.label18:setText("MENTE");
    obj.label18:setName("label18");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.rectangle16);
    obj.label19:setMargins({left=5});
    obj.label19:setHorzTextAlign("center");
    obj.label19:setAlign("left");
    obj.label19:setWidth(40);
    obj.label19:setText("MOD");
    obj.label19:setName("label19");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.rectangle16);
    obj.label20:setMargins({left=5});
    obj.label20:setHorzTextAlign("center");
    obj.label20:setAlign("left");
    obj.label20:setWidth(40);
    obj.label20:setText("OUT");
    obj.label20:setName("label20");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout3);
    obj.rectangle17:setPadding({top=3,bottom=5});
    obj.rectangle17:setAlign("top");
    obj.rectangle17:setHeight(35);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setName("rectangle17");

    obj.INTELIGENCIA = GUI.fromHandle(_obj_newObject("label"));
    obj.INTELIGENCIA:setParent(obj.rectangle17);
    obj.INTELIGENCIA:setMargins({left=5});
    obj.INTELIGENCIA:setAlign("left");
    obj.INTELIGENCIA:setHorzTextAlign("center");
    obj.INTELIGENCIA:setWidth(100);
    obj.INTELIGENCIA:setText("INTELIGÊNCIA");
    obj.INTELIGENCIA:setName("INTELIGENCIA");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.rectangle17);
    obj.edit18:setMargins({left=5});
    obj.edit18:setAlign("left");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setWidth(40);
    obj.edit18:setField("INTE");
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.rectangle17);
    obj.edit19:setMargins({left=5});
    obj.edit19:setAlign("left");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setWidth(40);
    obj.edit19:setField("INTE_OUT");
    obj.edit19:setName("edit19");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout3);
    obj.rectangle18:setPadding({top=3,bottom=5});
    obj.rectangle18:setAlign("top");
    obj.rectangle18:setHeight(35);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setName("rectangle18");

    obj.PRESENCA = GUI.fromHandle(_obj_newObject("label"));
    obj.PRESENCA:setParent(obj.rectangle18);
    obj.PRESENCA:setMargins({left=5});
    obj.PRESENCA:setAlign("left");
    obj.PRESENCA:setHorzTextAlign("center");
    obj.PRESENCA:setWidth(100);
    obj.PRESENCA:setText("PRESENÇA");
    obj.PRESENCA:setName("PRESENCA");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.rectangle18);
    obj.edit20:setMargins({left=5});
    obj.edit20:setAlign("left");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setWidth(40);
    obj.edit20:setField("PRE");
    obj.edit20:setName("edit20");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.rectangle18);
    obj.edit21:setMargins({left=5});
    obj.edit21:setAlign("left");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setWidth(40);
    obj.edit21:setField("PRES_OUT");
    obj.edit21:setName("edit21");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout3);
    obj.rectangle19:setPadding({top=3,bottom=5});
    obj.rectangle19:setAlign("top");
    obj.rectangle19:setHeight(35);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setName("rectangle19");

    obj.SABEDORIA = GUI.fromHandle(_obj_newObject("label"));
    obj.SABEDORIA:setParent(obj.rectangle19);
    obj.SABEDORIA:setMargins({left=5});
    obj.SABEDORIA:setAlign("left");
    obj.SABEDORIA:setHorzTextAlign("center");
    obj.SABEDORIA:setWidth(100);
    obj.SABEDORIA:setText("SABEDORIA");
    obj.SABEDORIA:setName("SABEDORIA");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.rectangle19);
    obj.edit22:setMargins({left=5});
    obj.edit22:setAlign("left");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setWidth(40);
    obj.edit22:setField("SAB");
    obj.edit22:setName("edit22");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.rectangle19);
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
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(700);
    obj.layout5:setName("layout5");

    obj.tabControl2 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl2:setParent(obj.layout5);
    obj.tabControl2:setAlign("left");
    obj.tabControl2:setWidth(350);
    obj.tabControl2:setName("tabControl2");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl2);
    obj.tab2:setTitle("Corpo");
    obj.tab2:setName("tab2");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.tab2);
    obj.layout6:setHeight(400);
    obj.layout6:setAlign("top");
    obj.layout6:setMargins({left=35});
    obj.layout6:setName("layout6");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout6);
    obj.label21:setAlign("top");
    obj.label21:setHeight(50);
    obj.label21:setText("Corpo");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setFontSize(20);
    obj.label21:setName("label21");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout6);
    obj.layout7:setHeight(30);
    obj.layout7:setAlign("top");
    obj.layout7:setMargins({top=3});
    obj.layout7:setName("layout7");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout7);
    obj.label22:setText("Pericias");
    obj.label22:setTop(5);
    obj.label22:setHorzTextAlign("center");
    obj.label22:setAlign("left");
    obj.label22:setName("label22");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout7);
    obj.label23:setText("Atr");
    obj.label23:setAlign("left");
    obj.label23:setMargins({left = 5});
    obj.label23:setWidth(30);
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout7);
    obj.label24:setText("Grad");
    obj.label24:setAlign("left");
    obj.label24:setMargins({left = 5});
    obj.label24:setWidth(30);
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout7);
    obj.label25:setText("Out");
    obj.label25:setAlign("left");
    obj.label25:setMargins({left = 5});
    obj.label25:setWidth(30);
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout7);
    obj.label26:setText("Total");
    obj.label26:setAlign("left");
    obj.label26:setMargins({left = 5});
    obj.label26:setWidth(30);
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout6);
    obj.layout8:setHeight(30);
    obj.layout8:setAlign("top");
    obj.layout8:setMargins({top=3});
    obj.layout8:setName("layout8");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout8);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setAlign("left");
    obj.rectangle20:setWidth(120);
    obj.rectangle20:setName("rectangle20");

    obj.Acrobacia = GUI.fromHandle(_obj_newObject("label"));
    obj.Acrobacia:setParent(obj.rectangle20);
    obj.Acrobacia:setName("Acrobacia");
    obj.Acrobacia:setText("Acrobacia");
    obj.Acrobacia:setTop(5);
    obj.Acrobacia:setHorzTextAlign("center");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout8);
    obj.edit24:setField("AGI");
    obj.edit24:setAlign("left");
    obj.edit24:setMargins({left = 5});
    obj.edit24:setWidth(30);
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setReadOnly(true);
    obj.edit24:setName("edit24");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout8);
    obj.edit25:setField("ACR_Grad");
    obj.edit25:setAlign("left");
    obj.edit25:setMargins({left = 5});
    obj.edit25:setWidth(30);
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setName("edit25");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout8);
    obj.edit26:setField("ACR_Out");
    obj.edit26:setAlign("left");
    obj.edit26:setMargins({left = 5});
    obj.edit26:setWidth(30);
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setName("edit26");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout8);
    obj.label27:setField("ACR_Total");
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

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout9);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setAlign("left");
    obj.rectangle21:setWidth(120);
    obj.rectangle21:setName("rectangle21");

    obj.Atletismo = GUI.fromHandle(_obj_newObject("label"));
    obj.Atletismo:setParent(obj.rectangle21);
    obj.Atletismo:setName("Atletismo");
    obj.Atletismo:setText("Atletismo");
    obj.Atletismo:setTop(5);
    obj.Atletismo:setHorzTextAlign("center");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout9);
    obj.edit27:setField("FOR");
    obj.edit27:setAlign("left");
    obj.edit27:setMargins({left = 5});
    obj.edit27:setWidth(30);
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setReadOnly(true);
    obj.edit27:setName("edit27");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout9);
    obj.edit28:setField("ATL_Grad");
    obj.edit28:setAlign("left");
    obj.edit28:setMargins({left = 5});
    obj.edit28:setWidth(30);
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setName("edit28");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout9);
    obj.edit29:setField("ATL_Out");
    obj.edit29:setAlign("left");
    obj.edit29:setMargins({left = 5});
    obj.edit29:setWidth(30);
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setName("edit29");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout9);
    obj.label28:setField("ATL_Total");
    obj.label28:setAlign("left");
    obj.label28:setMargins({left = 5});
    obj.label28:setWidth(30);
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout6);
    obj.layout10:setHeight(30);
    obj.layout10:setAlign("top");
    obj.layout10:setMargins({top=3});
    obj.layout10:setName("layout10");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout10);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setAlign("left");
    obj.rectangle22:setWidth(120);
    obj.rectangle22:setName("rectangle22");

    obj.CorpoACorpo = GUI.fromHandle(_obj_newObject("label"));
    obj.CorpoACorpo:setParent(obj.rectangle22);
    obj.CorpoACorpo:setName("CorpoACorpo");
    obj.CorpoACorpo:setText("Corpo-a-Corpo");
    obj.CorpoACorpo:setTop(5);
    obj.CorpoACorpo:setHorzTextAlign("center");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout10);
    obj.edit30:setField("LUT");
    obj.edit30:setAlign("left");
    obj.edit30:setMargins({left = 5});
    obj.edit30:setWidth(30);
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setReadOnly(true);
    obj.edit30:setName("edit30");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout10);
    obj.edit31:setField("COR_Grad");
    obj.edit31:setAlign("left");
    obj.edit31:setMargins({left = 5});
    obj.edit31:setWidth(30);
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setName("edit31");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout10);
    obj.edit32:setField("COR_Out");
    obj.edit32:setAlign("left");
    obj.edit32:setMargins({left = 5});
    obj.edit32:setWidth(30);
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setName("edit32");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout10);
    obj.label29:setField("COR_Total");
    obj.label29:setAlign("left");
    obj.label29:setMargins({left = 5});
    obj.label29:setWidth(30);
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout6);
    obj.layout11:setHeight(30);
    obj.layout11:setAlign("top");
    obj.layout11:setMargins({top=3});
    obj.layout11:setName("layout11");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout11);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setAlign("left");
    obj.rectangle23:setWidth(120);
    obj.rectangle23:setName("rectangle23");

    obj.Furtividade = GUI.fromHandle(_obj_newObject("label"));
    obj.Furtividade:setParent(obj.rectangle23);
    obj.Furtividade:setName("Furtividade");
    obj.Furtividade:setText("Furtividade");
    obj.Furtividade:setTop(5);
    obj.Furtividade:setHorzTextAlign("center");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout11);
    obj.edit33:setField("AGI");
    obj.edit33:setAlign("left");
    obj.edit33:setMargins({left = 5});
    obj.edit33:setWidth(30);
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setReadOnly(true);
    obj.edit33:setName("edit33");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout11);
    obj.edit34:setField("FUR_Grad");
    obj.edit34:setAlign("left");
    obj.edit34:setMargins({left = 5});
    obj.edit34:setWidth(30);
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setName("edit34");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout11);
    obj.edit35:setField("FUR_Out");
    obj.edit35:setAlign("left");
    obj.edit35:setMargins({left = 5});
    obj.edit35:setWidth(30);
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setName("edit35");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout11);
    obj.label30:setField("FUR_Total");
    obj.label30:setAlign("left");
    obj.label30:setMargins({left = 5});
    obj.label30:setWidth(30);
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout6);
    obj.layout12:setHeight(30);
    obj.layout12:setAlign("top");
    obj.layout12:setMargins({top=3});
    obj.layout12:setName("layout12");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout12);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setAlign("left");
    obj.rectangle24:setWidth(120);
    obj.rectangle24:setName("rectangle24");

    obj.Prestidigitacao = GUI.fromHandle(_obj_newObject("label"));
    obj.Prestidigitacao:setParent(obj.rectangle24);
    obj.Prestidigitacao:setName("Prestidigitacao");
    obj.Prestidigitacao:setText("Prestidigitação");
    obj.Prestidigitacao:setTop(5);
    obj.Prestidigitacao:setHorzTextAlign("center");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout12);
    obj.edit36:setField("DES");
    obj.edit36:setAlign("left");
    obj.edit36:setMargins({left = 5});
    obj.edit36:setWidth(30);
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setReadOnly(true);
    obj.edit36:setName("edit36");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout12);
    obj.edit37:setField("PRE_Grad");
    obj.edit37:setAlign("left");
    obj.edit37:setMargins({left = 5});
    obj.edit37:setWidth(30);
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setName("edit37");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout12);
    obj.edit38:setField("PRE_Out");
    obj.edit38:setAlign("left");
    obj.edit38:setMargins({left = 5});
    obj.edit38:setWidth(30);
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setName("edit38");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout12);
    obj.label31:setField("PRE_Total");
    obj.label31:setAlign("left");
    obj.label31:setMargins({left = 5});
    obj.label31:setWidth(30);
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout6);
    obj.layout13:setHeight(30);
    obj.layout13:setAlign("top");
    obj.layout13:setMargins({top=3});
    obj.layout13:setName("layout13");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout13);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setAlign("left");
    obj.rectangle25:setWidth(120);
    obj.rectangle25:setName("rectangle25");

    obj.VeiculosMagicos = GUI.fromHandle(_obj_newObject("label"));
    obj.VeiculosMagicos:setParent(obj.rectangle25);
    obj.VeiculosMagicos:setName("VeiculosMagicos");
    obj.VeiculosMagicos:setText("Veiculos Mágicos");
    obj.VeiculosMagicos:setTop(5);
    obj.VeiculosMagicos:setHorzTextAlign("center");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout13);
    obj.edit39:setField("AGI");
    obj.edit39:setAlign("left");
    obj.edit39:setMargins({left = 5});
    obj.edit39:setWidth(30);
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setReadOnly(true);
    obj.edit39:setName("edit39");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout13);
    obj.edit40:setField("VEI_Grad");
    obj.edit40:setAlign("left");
    obj.edit40:setMargins({left = 5});
    obj.edit40:setWidth(30);
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setName("edit40");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout13);
    obj.edit41:setField("VEI_Out");
    obj.edit41:setAlign("left");
    obj.edit41:setMargins({left = 5});
    obj.edit41:setWidth(30);
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setName("edit41");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout13);
    obj.label32:setField("VEI_Total");
    obj.label32:setAlign("left");
    obj.label32:setMargins({left = 5});
    obj.label32:setWidth(30);
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl2);
    obj.tab3:setTitle("Mente");
    obj.tab3:setWidth(134);
    obj.tab3:setName("tab3");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.tab3);
    obj.layout14:setHeight(500);
    obj.layout14:setMargins({left=35});
    obj.layout14:setAlign("top");
    obj.layout14:setName("layout14");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout14);
    obj.label33:setAlign("top");
    obj.label33:setHeight(50);
    obj.label33:setText("Mente");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setFontSize(20);
    obj.label33:setName("label33");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout14);
    obj.layout15:setHeight(30);
    obj.layout15:setAlign("top");
    obj.layout15:setMargins({top=3});
    obj.layout15:setName("layout15");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout15);
    obj.label34:setText("Pericias");
    obj.label34:setTop(5);
    obj.label34:setHorzTextAlign("center");
    obj.label34:setAlign("left");
    obj.label34:setName("label34");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout15);
    obj.label35:setText("Atr");
    obj.label35:setAlign("left");
    obj.label35:setMargins({left = 5});
    obj.label35:setWidth(30);
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout15);
    obj.label36:setText("Grad");
    obj.label36:setAlign("left");
    obj.label36:setMargins({left = 5});
    obj.label36:setWidth(30);
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout15);
    obj.label37:setText("Out");
    obj.label37:setAlign("left");
    obj.label37:setMargins({left = 5});
    obj.label37:setWidth(30);
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout15);
    obj.label38:setText("Total");
    obj.label38:setAlign("left");
    obj.label38:setMargins({left = 5});
    obj.label38:setWidth(30);
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout14);
    obj.layout16:setHeight(30);
    obj.layout16:setAlign("top");
    obj.layout16:setMargins({top=3});
    obj.layout16:setName("layout16");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout16);
    obj.rectangle26:setColor("black");
    obj.rectangle26:setAlign("left");
    obj.rectangle26:setWidth(120);
    obj.rectangle26:setName("rectangle26");

    obj.Concentracao = GUI.fromHandle(_obj_newObject("label"));
    obj.Concentracao:setParent(obj.rectangle26);
    obj.Concentracao:setName("Concentracao");
    obj.Concentracao:setText("Concentração");
    obj.Concentracao:setTop(5);
    obj.Concentracao:setHorzTextAlign("center");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout16);
    obj.edit42:setField("SAB");
    obj.edit42:setAlign("left");
    obj.edit42:setMargins({left = 5});
    obj.edit42:setWidth(30);
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setReadOnly(true);
    obj.edit42:setName("edit42");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout16);
    obj.edit43:setField("CON_Grad");
    obj.edit43:setAlign("left");
    obj.edit43:setMargins({left = 5});
    obj.edit43:setWidth(30);
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setName("edit43");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout16);
    obj.edit44:setField("CON_Out");
    obj.edit44:setAlign("left");
    obj.edit44:setMargins({left = 5});
    obj.edit44:setWidth(30);
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setName("edit44");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout16);
    obj.label39:setField("CON_Total");
    obj.label39:setAlign("left");
    obj.label39:setMargins({left = 5});
    obj.label39:setWidth(30);
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout14);
    obj.layout17:setHeight(30);
    obj.layout17:setAlign("top");
    obj.layout17:setMargins({top=3});
    obj.layout17:setName("layout17");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout17);
    obj.rectangle27:setColor("black");
    obj.rectangle27:setAlign("left");
    obj.rectangle27:setWidth(120);
    obj.rectangle27:setName("rectangle27");

    obj.Enganacao = GUI.fromHandle(_obj_newObject("label"));
    obj.Enganacao:setParent(obj.rectangle27);
    obj.Enganacao:setName("Enganacao");
    obj.Enganacao:setText("Enganação");
    obj.Enganacao:setTop(5);
    obj.Enganacao:setHorzTextAlign("center");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout17);
    obj.edit45:setField("PRE");
    obj.edit45:setAlign("left");
    obj.edit45:setMargins({left = 5});
    obj.edit45:setWidth(30);
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setReadOnly(true);
    obj.edit45:setName("edit45");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout17);
    obj.edit46:setField("ENG_Grad");
    obj.edit46:setAlign("left");
    obj.edit46:setMargins({left = 5});
    obj.edit46:setWidth(30);
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setName("edit46");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout17);
    obj.edit47:setField("ENG_Out");
    obj.edit47:setAlign("left");
    obj.edit47:setMargins({left = 5});
    obj.edit47:setWidth(30);
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setName("edit47");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout17);
    obj.label40:setField("ENG_Total");
    obj.label40:setAlign("left");
    obj.label40:setMargins({left = 5});
    obj.label40:setWidth(30);
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout14);
    obj.layout18:setHeight(30);
    obj.layout18:setAlign("top");
    obj.layout18:setMargins({top=3});
    obj.layout18:setName("layout18");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout18);
    obj.rectangle28:setColor("black");
    obj.rectangle28:setAlign("left");
    obj.rectangle28:setWidth(120);
    obj.rectangle28:setName("rectangle28");

    obj.Intimidacao = GUI.fromHandle(_obj_newObject("label"));
    obj.Intimidacao:setParent(obj.rectangle28);
    obj.Intimidacao:setName("Intimidacao");
    obj.Intimidacao:setText("Intimidação");
    obj.Intimidacao:setTop(5);
    obj.Intimidacao:setHorzTextAlign("center");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout18);
    obj.edit48:setField("PRE");
    obj.edit48:setAlign("left");
    obj.edit48:setMargins({left = 5});
    obj.edit48:setWidth(30);
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setReadOnly(true);
    obj.edit48:setName("edit48");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout18);
    obj.edit49:setField("INT_Grad");
    obj.edit49:setAlign("left");
    obj.edit49:setMargins({left = 5});
    obj.edit49:setWidth(30);
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setName("edit49");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout18);
    obj.edit50:setField("INT_Out");
    obj.edit50:setAlign("left");
    obj.edit50:setMargins({left = 5});
    obj.edit50:setWidth(30);
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setName("edit50");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout18);
    obj.label41:setField("INT_Total");
    obj.label41:setAlign("left");
    obj.label41:setMargins({left = 5});
    obj.label41:setWidth(30);
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout14);
    obj.layout19:setHeight(30);
    obj.layout19:setAlign("top");
    obj.layout19:setMargins({top=3});
    obj.layout19:setName("layout19");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout19);
    obj.rectangle29:setColor("black");
    obj.rectangle29:setAlign("left");
    obj.rectangle29:setWidth(120);
    obj.rectangle29:setName("rectangle29");

    obj.Intuicao = GUI.fromHandle(_obj_newObject("label"));
    obj.Intuicao:setParent(obj.rectangle29);
    obj.Intuicao:setName("Intuicao");
    obj.Intuicao:setText("Intuição");
    obj.Intuicao:setTop(5);
    obj.Intuicao:setHorzTextAlign("center");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout19);
    obj.edit51:setField("SAB");
    obj.edit51:setAlign("left");
    obj.edit51:setMargins({left = 5});
    obj.edit51:setWidth(30);
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setReadOnly(true);
    obj.edit51:setName("edit51");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout19);
    obj.edit52:setField("INTU_Grad");
    obj.edit52:setAlign("left");
    obj.edit52:setMargins({left = 5});
    obj.edit52:setWidth(30);
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setName("edit52");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout19);
    obj.edit53:setField("INTU_Out");
    obj.edit53:setAlign("left");
    obj.edit53:setMargins({left = 5});
    obj.edit53:setWidth(30);
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setName("edit53");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout19);
    obj.label42:setField("INTU_Total");
    obj.label42:setAlign("left");
    obj.label42:setMargins({left = 5});
    obj.label42:setWidth(30);
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout14);
    obj.layout20:setHeight(30);
    obj.layout20:setAlign("top");
    obj.layout20:setMargins({top=3});
    obj.layout20:setName("layout20");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout20);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setAlign("left");
    obj.rectangle30:setWidth(120);
    obj.rectangle30:setName("rectangle30");

    obj.Investigacao = GUI.fromHandle(_obj_newObject("label"));
    obj.Investigacao:setParent(obj.rectangle30);
    obj.Investigacao:setName("Investigacao");
    obj.Investigacao:setText("Investigação");
    obj.Investigacao:setTop(5);
    obj.Investigacao:setHorzTextAlign("center");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout20);
    obj.edit54:setField("INTE");
    obj.edit54:setAlign("left");
    obj.edit54:setMargins({left = 5});
    obj.edit54:setWidth(30);
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setReadOnly(true);
    obj.edit54:setName("edit54");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout20);
    obj.edit55:setField("INV_Grad");
    obj.edit55:setAlign("left");
    obj.edit55:setMargins({left = 5});
    obj.edit55:setWidth(30);
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setName("edit55");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout20);
    obj.edit56:setField("INV_Out");
    obj.edit56:setAlign("left");
    obj.edit56:setMargins({left = 5});
    obj.edit56:setWidth(30);
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setName("edit56");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout20);
    obj.label43:setField("INV_Total");
    obj.label43:setAlign("left");
    obj.label43:setMargins({left = 5});
    obj.label43:setWidth(30);
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout14);
    obj.layout21:setHeight(30);
    obj.layout21:setAlign("top");
    obj.layout21:setMargins({top=3});
    obj.layout21:setName("layout21");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout21);
    obj.rectangle31:setColor("black");
    obj.rectangle31:setAlign("left");
    obj.rectangle31:setWidth(120);
    obj.rectangle31:setName("rectangle31");

    obj.Percepcao = GUI.fromHandle(_obj_newObject("label"));
    obj.Percepcao:setParent(obj.rectangle31);
    obj.Percepcao:setName("Percepcao");
    obj.Percepcao:setText("Percepção");
    obj.Percepcao:setTop(5);
    obj.Percepcao:setHorzTextAlign("center");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout21);
    obj.edit57:setField("SAB");
    obj.edit57:setAlign("left");
    obj.edit57:setMargins({left = 5});
    obj.edit57:setWidth(30);
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setReadOnly(true);
    obj.edit57:setName("edit57");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout21);
    obj.edit58:setField("PERC_Grad");
    obj.edit58:setAlign("left");
    obj.edit58:setMargins({left = 5});
    obj.edit58:setWidth(30);
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setName("edit58");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout21);
    obj.edit59:setField("PERC_Out");
    obj.edit59:setAlign("left");
    obj.edit59:setMargins({left = 5});
    obj.edit59:setWidth(30);
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setName("edit59");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout21);
    obj.label44:setField("PERC_Total");
    obj.label44:setAlign("left");
    obj.label44:setMargins({left = 5});
    obj.label44:setWidth(30);
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout14);
    obj.layout22:setHeight(30);
    obj.layout22:setAlign("top");
    obj.layout22:setMargins({top=3});
    obj.layout22:setName("layout22");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout22);
    obj.rectangle32:setColor("black");
    obj.rectangle32:setAlign("left");
    obj.rectangle32:setWidth(120);
    obj.rectangle32:setName("rectangle32");

    obj.Persuacao = GUI.fromHandle(_obj_newObject("label"));
    obj.Persuacao:setParent(obj.rectangle32);
    obj.Persuacao:setName("Persuacao");
    obj.Persuacao:setText("Persuação");
    obj.Persuacao:setTop(5);
    obj.Persuacao:setHorzTextAlign("center");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout22);
    obj.edit60:setField("PRE");
    obj.edit60:setAlign("left");
    obj.edit60:setMargins({left = 5});
    obj.edit60:setWidth(30);
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setReadOnly(true);
    obj.edit60:setName("edit60");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout22);
    obj.edit61:setField("PERS_Grad");
    obj.edit61:setAlign("left");
    obj.edit61:setMargins({left = 5});
    obj.edit61:setWidth(30);
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setName("edit61");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout22);
    obj.edit62:setField("PERS_Out");
    obj.edit62:setAlign("left");
    obj.edit62:setMargins({left = 5});
    obj.edit62:setWidth(30);
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setName("edit62");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout22);
    obj.label45:setField("PERS_Total");
    obj.label45:setAlign("left");
    obj.label45:setMargins({left = 5});
    obj.label45:setWidth(30);
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout14);
    obj.layout23:setHeight(30);
    obj.layout23:setAlign("top");
    obj.layout23:setMargins({top=3});
    obj.layout23:setName("layout23");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout23);
    obj.rectangle33:setColor("black");
    obj.rectangle33:setAlign("left");
    obj.rectangle33:setWidth(120);
    obj.rectangle33:setName("rectangle33");

    obj.Tratamento = GUI.fromHandle(_obj_newObject("label"));
    obj.Tratamento:setParent(obj.rectangle33);
    obj.Tratamento:setName("Tratamento");
    obj.Tratamento:setText("Tratamento");
    obj.Tratamento:setTop(5);
    obj.Tratamento:setHorzTextAlign("center");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout23);
    obj.edit63:setField("INTE");
    obj.edit63:setAlign("left");
    obj.edit63:setMargins({left = 5});
    obj.edit63:setWidth(30);
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setReadOnly(true);
    obj.edit63:setName("edit63");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout23);
    obj.edit64:setField("TRA_Grad");
    obj.edit64:setAlign("left");
    obj.edit64:setMargins({left = 5});
    obj.edit64:setWidth(30);
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setName("edit64");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout23);
    obj.edit65:setField("TRA_Out");
    obj.edit65:setAlign("left");
    obj.edit65:setMargins({left = 5});
    obj.edit65:setWidth(30);
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setName("edit65");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout23);
    obj.label46:setField("TRA_Total");
    obj.label46:setAlign("left");
    obj.label46:setMargins({left = 5});
    obj.label46:setWidth(30);
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl2);
    obj.tab4:setTitle("Conhecimentos");
    obj.tab4:setName("tab4");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.tab4);
    obj.layout24:setHeight(600);
    obj.layout24:setMargins({left=35});
    obj.layout24:setAlign("top");
    obj.layout24:setName("layout24");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout24);
    obj.label47:setAlign("top");
    obj.label47:setHeight(50);
    obj.label47:setText("Conhecimentos");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setFontSize(20);
    obj.label47:setName("label47");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout24);
    obj.layout25:setHeight(30);
    obj.layout25:setAlign("top");
    obj.layout25:setMargins({top=3});
    obj.layout25:setName("layout25");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout25);
    obj.label48:setText("Pericias");
    obj.label48:setTop(5);
    obj.label48:setHorzTextAlign("center");
    obj.label48:setAlign("left");
    obj.label48:setName("label48");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout25);
    obj.label49:setText("Atr");
    obj.label49:setAlign("left");
    obj.label49:setMargins({left = 5});
    obj.label49:setWidth(30);
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout25);
    obj.label50:setText("Grad");
    obj.label50:setAlign("left");
    obj.label50:setMargins({left = 5});
    obj.label50:setWidth(30);
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout25);
    obj.label51:setText("Out");
    obj.label51:setAlign("left");
    obj.label51:setMargins({left = 5});
    obj.label51:setWidth(30);
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout25);
    obj.label52:setText("Total");
    obj.label52:setAlign("left");
    obj.label52:setMargins({left = 5});
    obj.label52:setWidth(30);
    obj.label52:setHorzTextAlign("center");
    obj.label52:setName("label52");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout24);
    obj.layout26:setHeight(30);
    obj.layout26:setAlign("top");
    obj.layout26:setMargins({top=3});
    obj.layout26:setName("layout26");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout26);
    obj.rectangle34:setColor("black");
    obj.rectangle34:setAlign("left");
    obj.rectangle34:setWidth(120);
    obj.rectangle34:setName("rectangle34");

    obj.Atualidades = GUI.fromHandle(_obj_newObject("label"));
    obj.Atualidades:setParent(obj.rectangle34);
    obj.Atualidades:setName("Atualidades");
    obj.Atualidades:setText("Atualidades");
    obj.Atualidades:setTop(5);
    obj.Atualidades:setHorzTextAlign("center");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout26);
    obj.edit66:setField("INTE");
    obj.edit66:setAlign("left");
    obj.edit66:setMargins({left = 5});
    obj.edit66:setWidth(30);
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setReadOnly(true);
    obj.edit66:setName("edit66");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout26);
    obj.edit67:setField("ATU_Grad");
    obj.edit67:setAlign("left");
    obj.edit67:setMargins({left = 5});
    obj.edit67:setWidth(30);
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setName("edit67");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout26);
    obj.edit68:setField("ATU_Out");
    obj.edit68:setAlign("left");
    obj.edit68:setMargins({left = 5});
    obj.edit68:setWidth(30);
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setName("edit68");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout26);
    obj.label53:setField("ATU_Total");
    obj.label53:setAlign("left");
    obj.label53:setMargins({left = 5});
    obj.label53:setWidth(30);
    obj.label53:setHorzTextAlign("center");
    obj.label53:setName("label53");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout24);
    obj.layout27:setHeight(30);
    obj.layout27:setAlign("top");
    obj.layout27:setMargins({top=3});
    obj.layout27:setName("layout27");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout27);
    obj.rectangle35:setColor("black");
    obj.rectangle35:setAlign("left");
    obj.rectangle35:setWidth(120);
    obj.rectangle35:setName("rectangle35");

    obj.Adivinhacao = GUI.fromHandle(_obj_newObject("label"));
    obj.Adivinhacao:setParent(obj.rectangle35);
    obj.Adivinhacao:setName("Adivinhacao");
    obj.Adivinhacao:setText("Adivinhação");
    obj.Adivinhacao:setTop(5);
    obj.Adivinhacao:setHorzTextAlign("center");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout27);
    obj.edit69:setField("INTE");
    obj.edit69:setAlign("left");
    obj.edit69:setMargins({left = 5});
    obj.edit69:setWidth(30);
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setReadOnly(true);
    obj.edit69:setName("edit69");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout27);
    obj.edit70:setField("C_ADI_Grad");
    obj.edit70:setAlign("left");
    obj.edit70:setMargins({left = 5});
    obj.edit70:setWidth(30);
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setName("edit70");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout27);
    obj.edit71:setField("C_ADI_Out");
    obj.edit71:setAlign("left");
    obj.edit71:setMargins({left = 5});
    obj.edit71:setWidth(30);
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setName("edit71");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout27);
    obj.label54:setField("C_ADI_Total");
    obj.label54:setAlign("left");
    obj.label54:setMargins({left = 5});
    obj.label54:setWidth(30);
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout24);
    obj.layout28:setHeight(30);
    obj.layout28:setAlign("top");
    obj.layout28:setMargins({top=3});
    obj.layout28:setName("layout28");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout28);
    obj.rectangle36:setColor("black");
    obj.rectangle36:setAlign("left");
    obj.rectangle36:setWidth(120);
    obj.rectangle36:setName("rectangle36");

    obj.Azaracao = GUI.fromHandle(_obj_newObject("label"));
    obj.Azaracao:setParent(obj.rectangle36);
    obj.Azaracao:setName("Azaracao");
    obj.Azaracao:setText("Azaração");
    obj.Azaracao:setTop(5);
    obj.Azaracao:setHorzTextAlign("center");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout28);
    obj.edit72:setField("INTE");
    obj.edit72:setAlign("left");
    obj.edit72:setMargins({left = 5});
    obj.edit72:setWidth(30);
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setReadOnly(true);
    obj.edit72:setName("edit72");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout28);
    obj.edit73:setField("C_AZA_Grad");
    obj.edit73:setAlign("left");
    obj.edit73:setMargins({left = 5});
    obj.edit73:setWidth(30);
    obj.edit73:setHorzTextAlign("center");
    obj.edit73:setName("edit73");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout28);
    obj.edit74:setField("C_AZA_Out");
    obj.edit74:setAlign("left");
    obj.edit74:setMargins({left = 5});
    obj.edit74:setWidth(30);
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setName("edit74");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout28);
    obj.label55:setField("C_AZA_Total");
    obj.label55:setAlign("left");
    obj.label55:setMargins({left = 5});
    obj.label55:setWidth(30);
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout24);
    obj.layout29:setHeight(30);
    obj.layout29:setAlign("top");
    obj.layout29:setMargins({top=3});
    obj.layout29:setName("layout29");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout29);
    obj.rectangle37:setColor("black");
    obj.rectangle37:setAlign("left");
    obj.rectangle37:setWidth(120);
    obj.rectangle37:setName("rectangle37");

    obj.ContraFeitico = GUI.fromHandle(_obj_newObject("label"));
    obj.ContraFeitico:setParent(obj.rectangle37);
    obj.ContraFeitico:setName("ContraFeitico");
    obj.ContraFeitico:setText("Contra-Feitiço");
    obj.ContraFeitico:setTop(5);
    obj.ContraFeitico:setHorzTextAlign("center");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout29);
    obj.edit75:setField("INTE");
    obj.edit75:setAlign("left");
    obj.edit75:setMargins({left = 5});
    obj.edit75:setWidth(30);
    obj.edit75:setHorzTextAlign("center");
    obj.edit75:setReadOnly(true);
    obj.edit75:setName("edit75");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout29);
    obj.edit76:setField("C_CON_Grad");
    obj.edit76:setAlign("left");
    obj.edit76:setMargins({left = 5});
    obj.edit76:setWidth(30);
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setName("edit76");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout29);
    obj.edit77:setField("C_CON_Out");
    obj.edit77:setAlign("left");
    obj.edit77:setMargins({left = 5});
    obj.edit77:setWidth(30);
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setName("edit77");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout29);
    obj.label56:setField("C_CON_Total");
    obj.label56:setAlign("left");
    obj.label56:setMargins({left = 5});
    obj.label56:setWidth(30);
    obj.label56:setHorzTextAlign("center");
    obj.label56:setName("label56");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout24);
    obj.layout30:setHeight(30);
    obj.layout30:setAlign("top");
    obj.layout30:setMargins({top=3});
    obj.layout30:setName("layout30");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout30);
    obj.rectangle38:setColor("black");
    obj.rectangle38:setAlign("left");
    obj.rectangle38:setWidth(120);
    obj.rectangle38:setName("rectangle38");

    obj.CriaturasMagicas = GUI.fromHandle(_obj_newObject("label"));
    obj.CriaturasMagicas:setParent(obj.rectangle38);
    obj.CriaturasMagicas:setName("CriaturasMagicas");
    obj.CriaturasMagicas:setText("Criaturas Mágicas");
    obj.CriaturasMagicas:setTop(5);
    obj.CriaturasMagicas:setHorzTextAlign("center");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout30);
    obj.edit78:setField("INTE");
    obj.edit78:setAlign("left");
    obj.edit78:setMargins({left = 5});
    obj.edit78:setWidth(30);
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setReadOnly(true);
    obj.edit78:setName("edit78");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout30);
    obj.edit79:setField("C_CRI_Grad");
    obj.edit79:setAlign("left");
    obj.edit79:setMargins({left = 5});
    obj.edit79:setWidth(30);
    obj.edit79:setHorzTextAlign("center");
    obj.edit79:setName("edit79");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout30);
    obj.edit80:setField("C_CRI_Out");
    obj.edit80:setAlign("left");
    obj.edit80:setMargins({left = 5});
    obj.edit80:setWidth(30);
    obj.edit80:setHorzTextAlign("center");
    obj.edit80:setName("edit80");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout30);
    obj.label57:setField("C_CRI_Total");
    obj.label57:setAlign("left");
    obj.label57:setMargins({left = 5});
    obj.label57:setWidth(30);
    obj.label57:setHorzTextAlign("center");
    obj.label57:setName("label57");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout24);
    obj.layout31:setHeight(30);
    obj.layout31:setAlign("top");
    obj.layout31:setMargins({top=3});
    obj.layout31:setName("layout31");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout31);
    obj.rectangle39:setColor("black");
    obj.rectangle39:setAlign("left");
    obj.rectangle39:setWidth(120);
    obj.rectangle39:setName("rectangle39");

    obj.Encantamentos = GUI.fromHandle(_obj_newObject("label"));
    obj.Encantamentos:setParent(obj.rectangle39);
    obj.Encantamentos:setName("Encantamentos");
    obj.Encantamentos:setText("Encantamentos");
    obj.Encantamentos:setTop(5);
    obj.Encantamentos:setHorzTextAlign("center");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout31);
    obj.edit81:setField("INTE");
    obj.edit81:setAlign("left");
    obj.edit81:setMargins({left = 5});
    obj.edit81:setWidth(30);
    obj.edit81:setHorzTextAlign("center");
    obj.edit81:setReadOnly(true);
    obj.edit81:setName("edit81");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout31);
    obj.edit82:setField("C_ENC_Grad");
    obj.edit82:setAlign("left");
    obj.edit82:setMargins({left = 5});
    obj.edit82:setWidth(30);
    obj.edit82:setHorzTextAlign("center");
    obj.edit82:setName("edit82");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout31);
    obj.edit83:setField("C_ENC_Out");
    obj.edit83:setAlign("left");
    obj.edit83:setMargins({left = 5});
    obj.edit83:setWidth(30);
    obj.edit83:setHorzTextAlign("center");
    obj.edit83:setName("edit83");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout31);
    obj.label58:setField("C_ENC_Total");
    obj.label58:setAlign("left");
    obj.label58:setMargins({left = 5});
    obj.label58:setWidth(30);
    obj.label58:setHorzTextAlign("center");
    obj.label58:setName("label58");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout24);
    obj.layout32:setHeight(30);
    obj.layout32:setAlign("top");
    obj.layout32:setMargins({top=3});
    obj.layout32:setName("layout32");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout32);
    obj.rectangle40:setColor("black");
    obj.rectangle40:setAlign("left");
    obj.rectangle40:setWidth(120);
    obj.rectangle40:setName("rectangle40");

    obj.Feiticos = GUI.fromHandle(_obj_newObject("label"));
    obj.Feiticos:setParent(obj.rectangle40);
    obj.Feiticos:setName("Feiticos");
    obj.Feiticos:setText("Feitiços");
    obj.Feiticos:setTop(5);
    obj.Feiticos:setHorzTextAlign("center");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout32);
    obj.edit84:setField("INTE");
    obj.edit84:setAlign("left");
    obj.edit84:setMargins({left = 5});
    obj.edit84:setWidth(30);
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setReadOnly(true);
    obj.edit84:setName("edit84");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout32);
    obj.edit85:setField("C_FEI_Grad");
    obj.edit85:setAlign("left");
    obj.edit85:setMargins({left = 5});
    obj.edit85:setWidth(30);
    obj.edit85:setHorzTextAlign("center");
    obj.edit85:setName("edit85");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout32);
    obj.edit86:setField("C_FEI_Out");
    obj.edit86:setAlign("left");
    obj.edit86:setMargins({left = 5});
    obj.edit86:setWidth(30);
    obj.edit86:setHorzTextAlign("center");
    obj.edit86:setName("edit86");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout32);
    obj.label59:setField("C_FEI_Total");
    obj.label59:setAlign("left");
    obj.label59:setMargins({left = 5});
    obj.label59:setWidth(30);
    obj.label59:setHorzTextAlign("center");
    obj.label59:setName("label59");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout24);
    obj.layout33:setHeight(30);
    obj.layout33:setAlign("top");
    obj.layout33:setMargins({top=3});
    obj.layout33:setName("layout33");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout33);
    obj.rectangle41:setColor("black");
    obj.rectangle41:setAlign("left");
    obj.rectangle41:setWidth(120);
    obj.rectangle41:setName("rectangle41");

    obj.Herbologia = GUI.fromHandle(_obj_newObject("label"));
    obj.Herbologia:setParent(obj.rectangle41);
    obj.Herbologia:setName("Herbologia");
    obj.Herbologia:setText("Herbologia");
    obj.Herbologia:setTop(5);
    obj.Herbologia:setHorzTextAlign("center");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout33);
    obj.edit87:setField("INTE");
    obj.edit87:setAlign("left");
    obj.edit87:setMargins({left = 5});
    obj.edit87:setWidth(30);
    obj.edit87:setHorzTextAlign("center");
    obj.edit87:setReadOnly(true);
    obj.edit87:setName("edit87");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout33);
    obj.edit88:setField("C_HER_Grad");
    obj.edit88:setAlign("left");
    obj.edit88:setMargins({left = 5});
    obj.edit88:setWidth(30);
    obj.edit88:setHorzTextAlign("center");
    obj.edit88:setName("edit88");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout33);
    obj.edit89:setField("C_HER_Out");
    obj.edit89:setAlign("left");
    obj.edit89:setMargins({left = 5});
    obj.edit89:setWidth(30);
    obj.edit89:setHorzTextAlign("center");
    obj.edit89:setName("edit89");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout33);
    obj.label60:setField("C_HER_Total");
    obj.label60:setAlign("left");
    obj.label60:setMargins({left = 5});
    obj.label60:setWidth(30);
    obj.label60:setHorzTextAlign("center");
    obj.label60:setName("label60");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout24);
    obj.layout34:setHeight(30);
    obj.layout34:setAlign("top");
    obj.layout34:setMargins({top=3});
    obj.layout34:setName("layout34");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout34);
    obj.rectangle42:setColor("black");
    obj.rectangle42:setAlign("left");
    obj.rectangle42:setWidth(120);
    obj.rectangle42:setName("rectangle42");

    obj.DCAT = GUI.fromHandle(_obj_newObject("label"));
    obj.DCAT:setParent(obj.rectangle42);
    obj.DCAT:setName("DCAT");
    obj.DCAT:setText("Maldições (DCAT)");
    obj.DCAT:setTop(5);
    obj.DCAT:setHorzTextAlign("center");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout34);
    obj.edit90:setField("INTE");
    obj.edit90:setAlign("left");
    obj.edit90:setMargins({left = 5});
    obj.edit90:setWidth(30);
    obj.edit90:setHorzTextAlign("center");
    obj.edit90:setReadOnly(true);
    obj.edit90:setName("edit90");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout34);
    obj.edit91:setField("C_MAL_Grad");
    obj.edit91:setAlign("left");
    obj.edit91:setMargins({left = 5});
    obj.edit91:setWidth(30);
    obj.edit91:setHorzTextAlign("center");
    obj.edit91:setName("edit91");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout34);
    obj.edit92:setField("C_MAL_Out");
    obj.edit92:setAlign("left");
    obj.edit92:setMargins({left = 5});
    obj.edit92:setWidth(30);
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setName("edit92");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout34);
    obj.label61:setField("C_MAL_Total");
    obj.label61:setAlign("left");
    obj.label61:setMargins({left = 5});
    obj.label61:setWidth(30);
    obj.label61:setHorzTextAlign("center");
    obj.label61:setName("label61");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout24);
    obj.layout35:setHeight(30);
    obj.layout35:setAlign("top");
    obj.layout35:setMargins({top=3});
    obj.layout35:setName("layout35");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout35);
    obj.rectangle43:setColor("black");
    obj.rectangle43:setAlign("left");
    obj.rectangle43:setWidth(120);
    obj.rectangle43:setName("rectangle43");

    obj.Pocoes = GUI.fromHandle(_obj_newObject("label"));
    obj.Pocoes:setParent(obj.rectangle43);
    obj.Pocoes:setName("Pocoes");
    obj.Pocoes:setText("Poções");
    obj.Pocoes:setTop(5);
    obj.Pocoes:setHorzTextAlign("center");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout35);
    obj.edit93:setField("INTE");
    obj.edit93:setAlign("left");
    obj.edit93:setMargins({left = 5});
    obj.edit93:setWidth(30);
    obj.edit93:setHorzTextAlign("center");
    obj.edit93:setReadOnly(true);
    obj.edit93:setName("edit93");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout35);
    obj.edit94:setField("C_POC_Grad");
    obj.edit94:setAlign("left");
    obj.edit94:setMargins({left = 5});
    obj.edit94:setWidth(30);
    obj.edit94:setHorzTextAlign("center");
    obj.edit94:setName("edit94");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout35);
    obj.edit95:setField("C_POC_Out");
    obj.edit95:setAlign("left");
    obj.edit95:setMargins({left = 5});
    obj.edit95:setWidth(30);
    obj.edit95:setHorzTextAlign("center");
    obj.edit95:setName("edit95");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout35);
    obj.label62:setField("C_POC_Total");
    obj.label62:setAlign("left");
    obj.label62:setMargins({left = 5});
    obj.label62:setWidth(30);
    obj.label62:setHorzTextAlign("center");
    obj.label62:setName("label62");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout24);
    obj.layout36:setHeight(30);
    obj.layout36:setAlign("top");
    obj.layout36:setMargins({top=3});
    obj.layout36:setName("layout36");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout36);
    obj.rectangle44:setColor("black");
    obj.rectangle44:setAlign("left");
    obj.rectangle44:setWidth(120);
    obj.rectangle44:setName("rectangle44");

    obj.Runas = GUI.fromHandle(_obj_newObject("label"));
    obj.Runas:setParent(obj.rectangle44);
    obj.Runas:setName("Runas");
    obj.Runas:setText("Runas");
    obj.Runas:setTop(5);
    obj.Runas:setHorzTextAlign("center");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout36);
    obj.edit96:setField("INTE");
    obj.edit96:setAlign("left");
    obj.edit96:setMargins({left = 5});
    obj.edit96:setWidth(30);
    obj.edit96:setHorzTextAlign("center");
    obj.edit96:setReadOnly(true);
    obj.edit96:setName("edit96");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout36);
    obj.edit97:setField("C_RUN_Grad");
    obj.edit97:setAlign("left");
    obj.edit97:setMargins({left = 5});
    obj.edit97:setWidth(30);
    obj.edit97:setHorzTextAlign("center");
    obj.edit97:setName("edit97");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout36);
    obj.edit98:setField("C_RUN_Out");
    obj.edit98:setAlign("left");
    obj.edit98:setMargins({left = 5});
    obj.edit98:setWidth(30);
    obj.edit98:setHorzTextAlign("center");
    obj.edit98:setName("edit98");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout36);
    obj.label63:setField("C_RUN_Total");
    obj.label63:setAlign("left");
    obj.label63:setMargins({left = 5});
    obj.label63:setWidth(30);
    obj.label63:setHorzTextAlign("center");
    obj.label63:setName("label63");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout24);
    obj.layout37:setHeight(30);
    obj.layout37:setAlign("top");
    obj.layout37:setMargins({top=3});
    obj.layout37:setName("layout37");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout37);
    obj.rectangle45:setColor("black");
    obj.rectangle45:setAlign("left");
    obj.rectangle45:setWidth(120);
    obj.rectangle45:setName("rectangle45");

    obj.Transmutacao = GUI.fromHandle(_obj_newObject("label"));
    obj.Transmutacao:setParent(obj.rectangle45);
    obj.Transmutacao:setName("Transmutacao");
    obj.Transmutacao:setText("Transmutação");
    obj.Transmutacao:setTop(5);
    obj.Transmutacao:setHorzTextAlign("center");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout37);
    obj.edit99:setField("INTE");
    obj.edit99:setAlign("left");
    obj.edit99:setMargins({left = 5});
    obj.edit99:setWidth(30);
    obj.edit99:setHorzTextAlign("center");
    obj.edit99:setReadOnly(true);
    obj.edit99:setName("edit99");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout37);
    obj.edit100:setField("C_TRA_Grad");
    obj.edit100:setAlign("left");
    obj.edit100:setMargins({left = 5});
    obj.edit100:setWidth(30);
    obj.edit100:setHorzTextAlign("center");
    obj.edit100:setName("edit100");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout37);
    obj.edit101:setField("C_TRA_Out");
    obj.edit101:setAlign("left");
    obj.edit101:setMargins({left = 5});
    obj.edit101:setWidth(30);
    obj.edit101:setHorzTextAlign("center");
    obj.edit101:setName("edit101");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout37);
    obj.label64:setField("C_TRA_Total");
    obj.label64:setAlign("left");
    obj.label64:setMargins({left = 5});
    obj.label64:setWidth(30);
    obj.label64:setHorzTextAlign("center");
    obj.label64:setName("label64");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl2);
    obj.tab5:setTitle("Outros");
    obj.tab5:setName("tab5");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.tab5);
    obj.layout38:setHeight(400);
    obj.layout38:setAlign("top");
    obj.layout38:setPadding({left=10, right=10});
    obj.layout38:setName("layout38");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout38);
    obj.label65:setAlign("top");
    obj.label65:setHeight(50);
    obj.label65:setText("Outros");
    obj.label65:setHorzTextAlign("center");
    obj.label65:setFontSize(20);
    obj.label65:setName("label65");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout38);
    obj.button1:setAlign("top");
    obj.button1:setHeight(25);
    obj.button1:setText("Nova Pericia");
    obj.button1:setWidth(80);
    obj.button1:setName("button1");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout38);
    obj.layout39:setHeight(30);
    obj.layout39:setAlign("top");
    obj.layout39:setMargins({top=3, left=35});
    obj.layout39:setName("layout39");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout39);
    obj.label66:setText("Pericias");
    obj.label66:setTop(5);
    obj.label66:setHorzTextAlign("center");
    obj.label66:setAlign("left");
    obj.label66:setName("label66");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout39);
    obj.label67:setText("Atr");
    obj.label67:setAlign("left");
    obj.label67:setMargins({left = 5});
    obj.label67:setWidth(30);
    obj.label67:setHorzTextAlign("center");
    obj.label67:setName("label67");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout39);
    obj.label68:setText("Grad");
    obj.label68:setAlign("left");
    obj.label68:setMargins({left = 5});
    obj.label68:setWidth(30);
    obj.label68:setHorzTextAlign("center");
    obj.label68:setName("label68");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout39);
    obj.label69:setText("Out");
    obj.label69:setAlign("left");
    obj.label69:setMargins({left = 5});
    obj.label69:setWidth(30);
    obj.label69:setHorzTextAlign("center");
    obj.label69:setName("label69");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout39);
    obj.label70:setText("Total");
    obj.label70:setAlign("left");
    obj.label70:setMargins({left = 5});
    obj.label70:setWidth(30);
    obj.label70:setHorzTextAlign("center");
    obj.label70:setName("label70");

    obj.outrasPericias_record = GUI.fromHandle(_obj_newObject("recordList"));
    obj.outrasPericias_record:setParent(obj.layout38);
    obj.outrasPericias_record:setName("outrasPericias_record");
    obj.outrasPericias_record:setField("outrasPericias");
    obj.outrasPericias_record:setTemplateForm("outrasPericias");
    obj.outrasPericias_record:setAlign("top");
    obj.outrasPericias_record:setAutoHeight(true);

    obj.tabControl3 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl3:setParent(obj.layout5);
    obj.tabControl3:setAlign("left");
    obj.tabControl3:setWidth(300);
    obj.tabControl3:setName("tabControl3");

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl3);
    obj.tab6:setTitle("Defesas");
    obj.tab6:setWidth(220);
    obj.tab6:setName("tab6");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.tab6);
    obj.layout40:setHeight(320);
    obj.layout40:setMargins({left=20});
    obj.layout40:setAlign("top");
    obj.layout40:setName("layout40");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout40);
    obj.label71:setAlign("top");
    obj.label71:setHeight(50);
    obj.label71:setText("Defesas");
    obj.label71:setHorzTextAlign("center");
    obj.label71:setFontSize(20);
    obj.label71:setName("label71");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout40);
    obj.layout41:setHeight(30);
    obj.layout41:setAlign("top");
    obj.layout41:setMargins({top=3});
    obj.layout41:setName("layout41");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout41);
    obj.label72:setText("Pericias");
    obj.label72:setTop(5);
    obj.label72:setHorzTextAlign("center");
    obj.label72:setAlign("left");
    obj.label72:setName("label72");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout41);
    obj.label73:setText("Atr");
    obj.label73:setAlign("left");
    obj.label73:setMargins({left = 5});
    obj.label73:setWidth(30);
    obj.label73:setHorzTextAlign("center");
    obj.label73:setName("label73");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout41);
    obj.label74:setText("Grad");
    obj.label74:setAlign("left");
    obj.label74:setMargins({left = 5});
    obj.label74:setWidth(30);
    obj.label74:setHorzTextAlign("center");
    obj.label74:setName("label74");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout41);
    obj.label75:setText("Out");
    obj.label75:setAlign("left");
    obj.label75:setMargins({left = 5});
    obj.label75:setWidth(30);
    obj.label75:setHorzTextAlign("center");
    obj.label75:setName("label75");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout41);
    obj.label76:setText("Total");
    obj.label76:setAlign("left");
    obj.label76:setMargins({left = 5});
    obj.label76:setWidth(30);
    obj.label76:setHorzTextAlign("center");
    obj.label76:setName("label76");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout40);
    obj.layout42:setHeight(30);
    obj.layout42:setAlign("top");
    obj.layout42:setMargins({top=3});
    obj.layout42:setName("layout42");

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout42);
    obj.rectangle46:setColor("black");
    obj.rectangle46:setAlign("left");
    obj.rectangle46:setWidth(120);
    obj.rectangle46:setName("rectangle46");

    obj.Iniciativa = GUI.fromHandle(_obj_newObject("label"));
    obj.Iniciativa:setParent(obj.rectangle46);
    obj.Iniciativa:setName("Iniciativa");
    obj.Iniciativa:setText("Iniciativa");
    obj.Iniciativa:setTop(5);
    obj.Iniciativa:setHorzTextAlign("center");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout42);
    obj.edit102:setField("AGI");
    obj.edit102:setAlign("left");
    obj.edit102:setMargins({left = 5});
    obj.edit102:setWidth(30);
    obj.edit102:setHorzTextAlign("center");
    obj.edit102:setReadOnly(true);
    obj.edit102:setName("edit102");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout42);
    obj.edit103:setField("INI_Grad");
    obj.edit103:setAlign("left");
    obj.edit103:setMargins({left = 5});
    obj.edit103:setWidth(30);
    obj.edit103:setHorzTextAlign("center");
    obj.edit103:setName("edit103");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout42);
    obj.edit104:setField("INI_Out");
    obj.edit104:setAlign("left");
    obj.edit104:setMargins({left = 5});
    obj.edit104:setWidth(30);
    obj.edit104:setHorzTextAlign("center");
    obj.edit104:setName("edit104");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout42);
    obj.label77:setField("INI_Total");
    obj.label77:setAlign("left");
    obj.label77:setMargins({left = 5});
    obj.label77:setWidth(30);
    obj.label77:setHorzTextAlign("center");
    obj.label77:setName("label77");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout40);
    obj.layout43:setHeight(30);
    obj.layout43:setAlign("top");
    obj.layout43:setMargins({top=3});
    obj.layout43:setName("layout43");

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout43);
    obj.rectangle47:setColor("black");
    obj.rectangle47:setAlign("left");
    obj.rectangle47:setWidth(120);
    obj.rectangle47:setName("rectangle47");

    obj.Aparar = GUI.fromHandle(_obj_newObject("label"));
    obj.Aparar:setParent(obj.rectangle47);
    obj.Aparar:setName("Aparar");
    obj.Aparar:setText("Aparar");
    obj.Aparar:setTop(5);
    obj.Aparar:setHorzTextAlign("center");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout43);
    obj.edit105:setField("LUT");
    obj.edit105:setAlign("left");
    obj.edit105:setMargins({left = 5});
    obj.edit105:setWidth(30);
    obj.edit105:setHorzTextAlign("center");
    obj.edit105:setReadOnly(true);
    obj.edit105:setName("edit105");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout43);
    obj.edit106:setField("APA_Grad");
    obj.edit106:setAlign("left");
    obj.edit106:setMargins({left = 5});
    obj.edit106:setWidth(30);
    obj.edit106:setHorzTextAlign("center");
    obj.edit106:setName("edit106");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout43);
    obj.edit107:setField("APA_Out");
    obj.edit107:setAlign("left");
    obj.edit107:setMargins({left = 5});
    obj.edit107:setWidth(30);
    obj.edit107:setHorzTextAlign("center");
    obj.edit107:setName("edit107");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout43);
    obj.label78:setField("APA_Total");
    obj.label78:setAlign("left");
    obj.label78:setMargins({left = 5});
    obj.label78:setWidth(30);
    obj.label78:setHorzTextAlign("center");
    obj.label78:setName("label78");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout40);
    obj.layout44:setHeight(30);
    obj.layout44:setAlign("top");
    obj.layout44:setMargins({top=3});
    obj.layout44:setName("layout44");

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout44);
    obj.rectangle48:setColor("black");
    obj.rectangle48:setAlign("left");
    obj.rectangle48:setWidth(120);
    obj.rectangle48:setName("rectangle48");

    obj.Fortitude = GUI.fromHandle(_obj_newObject("label"));
    obj.Fortitude:setParent(obj.rectangle48);
    obj.Fortitude:setName("Fortitude");
    obj.Fortitude:setText("Fortitude");
    obj.Fortitude:setTop(5);
    obj.Fortitude:setHorzTextAlign("center");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout44);
    obj.edit108:setField("VIG");
    obj.edit108:setAlign("left");
    obj.edit108:setMargins({left = 5});
    obj.edit108:setWidth(30);
    obj.edit108:setHorzTextAlign("center");
    obj.edit108:setReadOnly(true);
    obj.edit108:setName("edit108");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout44);
    obj.edit109:setField("FORT_Grad");
    obj.edit109:setAlign("left");
    obj.edit109:setMargins({left = 5});
    obj.edit109:setWidth(30);
    obj.edit109:setHorzTextAlign("center");
    obj.edit109:setName("edit109");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout44);
    obj.edit110:setField("FORT_Out");
    obj.edit110:setAlign("left");
    obj.edit110:setMargins({left = 5});
    obj.edit110:setWidth(30);
    obj.edit110:setHorzTextAlign("center");
    obj.edit110:setName("edit110");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout44);
    obj.label79:setField("FORT_Total");
    obj.label79:setAlign("left");
    obj.label79:setMargins({left = 5});
    obj.label79:setWidth(30);
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout40);
    obj.layout45:setHeight(30);
    obj.layout45:setAlign("top");
    obj.layout45:setMargins({top=3});
    obj.layout45:setName("layout45");

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout45);
    obj.rectangle49:setColor("black");
    obj.rectangle49:setAlign("left");
    obj.rectangle49:setWidth(120);
    obj.rectangle49:setName("rectangle49");

    obj.Reflexo = GUI.fromHandle(_obj_newObject("label"));
    obj.Reflexo:setParent(obj.rectangle49);
    obj.Reflexo:setName("Reflexo");
    obj.Reflexo:setText("Reflexo");
    obj.Reflexo:setTop(5);
    obj.Reflexo:setHorzTextAlign("center");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout45);
    obj.edit111:setField("AGI");
    obj.edit111:setAlign("left");
    obj.edit111:setMargins({left = 5});
    obj.edit111:setWidth(30);
    obj.edit111:setHorzTextAlign("center");
    obj.edit111:setReadOnly(true);
    obj.edit111:setName("edit111");

    obj.edit112 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout45);
    obj.edit112:setField("REF_Grad");
    obj.edit112:setAlign("left");
    obj.edit112:setMargins({left = 5});
    obj.edit112:setWidth(30);
    obj.edit112:setHorzTextAlign("center");
    obj.edit112:setName("edit112");

    obj.edit113 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout45);
    obj.edit113:setField("REF_Out");
    obj.edit113:setAlign("left");
    obj.edit113:setMargins({left = 5});
    obj.edit113:setWidth(30);
    obj.edit113:setHorzTextAlign("center");
    obj.edit113:setName("edit113");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout45);
    obj.label80:setField("REF_Total");
    obj.label80:setAlign("left");
    obj.label80:setMargins({left = 5});
    obj.label80:setWidth(30);
    obj.label80:setHorzTextAlign("center");
    obj.label80:setName("label80");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout40);
    obj.layout46:setHeight(30);
    obj.layout46:setAlign("top");
    obj.layout46:setMargins({top=3});
    obj.layout46:setName("layout46");

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout46);
    obj.rectangle50:setColor("black");
    obj.rectangle50:setAlign("left");
    obj.rectangle50:setWidth(120);
    obj.rectangle50:setName("rectangle50");

    obj.Resistencia = GUI.fromHandle(_obj_newObject("label"));
    obj.Resistencia:setParent(obj.rectangle50);
    obj.Resistencia:setName("Resistencia");
    obj.Resistencia:setText("Resistencia");
    obj.Resistencia:setTop(5);
    obj.Resistencia:setHorzTextAlign("center");

    obj.edit114 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout46);
    obj.edit114:setField("VIG");
    obj.edit114:setAlign("left");
    obj.edit114:setMargins({left = 5});
    obj.edit114:setWidth(30);
    obj.edit114:setHorzTextAlign("center");
    obj.edit114:setReadOnly(true);
    obj.edit114:setName("edit114");

    obj.edit115 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout46);
    obj.edit115:setField("RES_Grad");
    obj.edit115:setAlign("left");
    obj.edit115:setMargins({left = 5});
    obj.edit115:setWidth(30);
    obj.edit115:setHorzTextAlign("center");
    obj.edit115:setName("edit115");

    obj.edit116 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout46);
    obj.edit116:setField("RES_Out");
    obj.edit116:setAlign("left");
    obj.edit116:setMargins({left = 5});
    obj.edit116:setWidth(30);
    obj.edit116:setHorzTextAlign("center");
    obj.edit116:setName("edit116");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout46);
    obj.label81:setField("RES_Total");
    obj.label81:setAlign("left");
    obj.label81:setMargins({left = 5});
    obj.label81:setWidth(30);
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout40);
    obj.layout47:setHeight(30);
    obj.layout47:setAlign("top");
    obj.layout47:setMargins({top=3});
    obj.layout47:setName("layout47");

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout47);
    obj.rectangle51:setColor("black");
    obj.rectangle51:setAlign("left");
    obj.rectangle51:setWidth(120);
    obj.rectangle51:setName("rectangle51");

    obj.Vontade = GUI.fromHandle(_obj_newObject("label"));
    obj.Vontade:setParent(obj.rectangle51);
    obj.Vontade:setName("Vontade");
    obj.Vontade:setText("Vontade");
    obj.Vontade:setTop(5);
    obj.Vontade:setHorzTextAlign("center");

    obj.edit117 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout47);
    obj.edit117:setField("SAB");
    obj.edit117:setAlign("left");
    obj.edit117:setMargins({left = 5});
    obj.edit117:setWidth(30);
    obj.edit117:setHorzTextAlign("center");
    obj.edit117:setReadOnly(true);
    obj.edit117:setName("edit117");

    obj.edit118 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout47);
    obj.edit118:setField("VON_Grad");
    obj.edit118:setAlign("left");
    obj.edit118:setMargins({left = 5});
    obj.edit118:setWidth(30);
    obj.edit118:setHorzTextAlign("center");
    obj.edit118:setName("edit118");

    obj.edit119 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout47);
    obj.edit119:setField("VON_Out");
    obj.edit119:setAlign("left");
    obj.edit119:setMargins({left = 5});
    obj.edit119:setWidth(30);
    obj.edit119:setHorzTextAlign("center");
    obj.edit119:setName("edit119");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout47);
    obj.label82:setField("VON_Total");
    obj.label82:setAlign("left");
    obj.label82:setMargins({left = 5});
    obj.label82:setWidth(30);
    obj.label82:setHorzTextAlign("center");
    obj.label82:setName("label82");

    obj.tab7 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl3);
    obj.tab7:setTitle("Treinos e Tarefas");
    obj.tab7:setWidth(220);
    obj.tab7:setName("tab7");



      local function condition(tipo)

    if tipo == "fisico" then

    if sheet.Exausto then
    return -5
    end

    if sheet.Fadigado then
    return -2
    end

    elseif tipo == "mental" then

    if sheet.Tiltado then
    return -5
    end

    if sheet.Frustrado then
    return -2
    end

    end

    return nil
    end

      local function ListaDeFeiticoParaTreino(str)
        require("utils.lua");

        local Raiz = NDB.load("listfetico.xml");
        local Filho = NDB.getChildNodes(Raiz);
        local mesaDoPersonagem = rrpg.getMesaDe(sheet);
        local chat = mesaDoPersonagem.chat

        ListaFeiticos = {} -- new array
        ListaNomesFeitico = {} -- new array

        for i = 1, #Filho, 1 do
        ListaFeiticos[i] = Raiz["f" .. i]
        ListaNomesFeitico[i] = Raiz["f" .. i].nome
        end

        table.sort(ListaNomesFeitico)

        Dialogs.choose("Selecione uma das opções", ListaNomesFeitico,
        function(selected, selectedIndex, selectedText)

        if selected then

        for k = 1, #Filho, 1 do

        if tostring(selectedText) == ListaFeiticos[k].nome then

          sheet.treinoCD = math.floor(totable(ListaFeiticos[k].cdfArray)[1] / 2  + 5)

          if str == "Praticar Feitiços" then
            chat:rolarDados("1d20+" .. (sheet.VIG or 0), "Prática Feitiço: " .. ListaFeiticos[k].nome .. " ( CD " .. sheet.treinoCD .. " )" .. (condition("fisico") and " Fisico " .. (-condition("fisico") or "") .. " = " .. (-condition("fisico") or "") + sheet.treinoCD or ""))
          else
            chat:rolarDados("1d20+" .. (sheet.INTE or 0), "Estudo Feitiço: " .. ListaFeiticos[k].nome .. " ( CD " .. sheet.treinoCD .. " )" .. (condition("mental") and " Mental " .. (-condition("mental") or "") .. " = " .. (-condition("mental") or "") + sheet.treinoCD or ""))
          end

        end

        end

        else

        end;

        end)

        end

      local function treinar()

        local mesaDoPersonagem = rrpg.getMesaDe(sheet);
        local chat = mesaDoPersonagem.chat
        local node = NDB.getRoot(sheet)

        Dialogs.choose("Escolha o tipo de treino:", {"Atributo", "Estudar", "Estudar Feitiços", "Praticar", "Praticar Feitiços"},
        function(selected, selectedIndex, selectedText)
        
          if selectedText == "Atributo" then

            local atributos = {
                ["Força"]       = "FOR",
                ["Destreza"]    = "DES",
                ["Vigor"]       = "VIG",
                ["Inteligencia"]= "INTE",
                ["Sabedoria"]   = "SAB",
                ["Presença"]    = "PRE",
            }

            Dialogs.choose("Escolha o atributo para treinar:", {"Força", "Destreza", "Vigor", "Inteligencia", "Sabedoria", "Presença"},
            function(selectedAttr, selectedAttrIndex, selectedAttrText)

              local atributo = atributos[selectedAttrText]
              local cd = tonumber(sheet[atributo] and sheet[atributo]) + 10
              showMessage(sheet[atributo])

              if selectedAttrText == "Força" or selectedAttrText == "Destreza" or selectedAttrText == "Vigor" then
                chat:rolarDados("1d20+" .. (sheet.VIG or 0), "Treino de " .. selectedAttrText .. " (CD " .. cd .. ")")
              else
                chat:rolarDados("1d20+" .. (sheet.INTE or 0), "Treino de " .. selectedAttrText .. " (CD " .. cd .. ")")
              end

            end)

          elseif selectedText == "Estudar" then
            Dialogs.inputQuery("Cadastro", "Informe Seu Nome", "",
            function (valorPreenchido)
              sheet.treinoCD = tonumber(valorPreenchido)
              if sheet.treinoCD == nil then
                showMessage("Valor inválido. Por favor, insira um número.");
                return;
              end
              local cd = tonumber(valorPreenchido)
              if not cd then
                showMessage("Valor inválido. Por favor, insira um número.")
                return
              end

              sheet.treinoCD = cd
              chat:rolarDados(
                "1d20+" .. (tonumber(sheet.VIG) or 0),
                "Estudo (CD " .. cd .. ") " .. (condition("mental") and "Mental " .. (-condition("mental") or "") .. " = " .. (-condition("mental") or "") + cd)
              )
            end,       

            function()
              showMessage("O usuário cancelou");
            end);
            
          elseif selectedText == "Praticar" then
           Dialogs.inputQuery("Cadastro", "Informe a CD do treino", "",
            function (valorPreenchido)
              local cd = tonumber(valorPreenchido)
              if not cd then
                showMessage("Valor inválido. Por favor, insira um número.")
                return
              end

              sheet.treinoCD = cd
              chat:rolarDados(
                "1d20+" .. (tonumber(sheet.VIG) or 0),
                "Pratica (CD " .. cd .. ") " .. (condition("fisico") and "Fisico " .. (-condition("fisico") or "") .. " = " .. (-condition("fisico") or "") + cd)
              )
            end,
            function()
              showMessage("O usuário cancelou")
            end
          )

          elseif selectedText == "Estudar Feitiços" then
            ListaDeFeiticoParaTreino(selectedText)
          elseif selectedText == "Praticar Feitiços" then
            ListaDeFeiticoParaTreino(selectedText)
          end

        end)

      end


        

    


    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.tab7);
    obj.layout48:setHeight(50);
    obj.layout48:setAlign("top");
    obj.layout48:setName("layout48");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout48);
    obj.button2:setText("Treinar");
    obj.button2:setAlign("top");
    obj.button2:setHeight(30);
    obj.button2:setMargins({left = 5, top = 15, right = 5});
    obj.button2:setHorzTextAlign("center");
    obj.button2:setName("button2");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.tab7);
    obj.scrollBox2:setHeight(600);
    obj.scrollBox2:setAlign("top");
    obj.scrollBox2:setName("scrollBox2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox2);
    obj.button3:setLeft(20);
    obj.button3:setTop(20);
    obj.button3:setHeight(25);
    obj.button3:setText("Nova Tarefa");
    obj.button3:setWidth(80);
    obj.button3:setName("button3");

    obj.kekzin = GUI.fromHandle(_obj_newObject("recordList"));
    obj.kekzin:setParent(obj.scrollBox2);
    obj.kekzin:setName("kekzin");
    obj.kekzin:setField("tarefasRecordList");
    obj.kekzin:setTemplateForm("frmItemDeMagia");
    obj.kekzin:setLeft(0);
    obj.kekzin:setTop(60);
    obj.kekzin:setWidth(300);
    obj.kekzin:setAutoHeight(true);

    obj.tab8 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tabControl3);
    obj.tab8:setTitle("Quadribol");
    obj.tab8:setWidth(220);
    obj.tab8:setName("tab8");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.tab8);
    obj.layout49:setHeight(600);
    obj.layout49:setMargins({left=20});
    obj.layout49:setAlign("top");
    obj.layout49:setName("layout49");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout49);
    obj.label83:setAlign("top");
    obj.label83:setHeight(50);
    obj.label83:setText("QUADRIBOL");
    obj.label83:setHorzTextAlign("center");
    obj.label83:setName("label83");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout49);
    obj.layout50:setHeight(30);
    obj.layout50:setAlign("top");
    obj.layout50:setName("layout50");

    obj.rectangle52 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.layout50);
    obj.rectangle52:setColor("black");
    obj.rectangle52:setAlign("left");
    obj.rectangle52:setWidth(90);
    obj.rectangle52:setName("rectangle52");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.rectangle52);
    obj.label84:setText("Golear");
    obj.label84:setWidth(90);
    obj.label84:setTop(5);
    obj.label84:setHorzTextAlign("center");
    obj.label84:setName("label84");

    obj.edit120 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout50);
    obj.edit120:setField("GOL_MOD");
    obj.edit120:setAlign("left");
    obj.edit120:setMargins({left = 5});
    obj.edit120:setWidth(30);
    obj.edit120:setHorzTextAlign("center");
    obj.edit120:setReadOnly(true);
    obj.edit120:setName("edit120");

    obj.rectangle53 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout50);
    obj.rectangle53:setColor("black");
    obj.rectangle53:setAlign("left");
    obj.rectangle53:setWidth(90);
    obj.rectangle53:setMargins({left = 10});
    obj.rectangle53:setName("rectangle53");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.rectangle53);
    obj.label85:setText("Passe");
    obj.label85:setWidth(90);
    obj.label85:setTop(5);
    obj.label85:setHorzTextAlign("center");
    obj.label85:setName("label85");

    obj.edit121 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout50);
    obj.edit121:setField("PAS_MOD");
    obj.edit121:setAlign("left");
    obj.edit121:setMargins({left = 5});
    obj.edit121:setWidth(30);
    obj.edit121:setHorzTextAlign("center");
    obj.edit121:setReadOnly(true);
    obj.edit121:setName("edit121");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout49);
    obj.layout51:setHeight(30);
    obj.layout51:setAlign("top");
    obj.layout51:setMargins({top=5});
    obj.layout51:setName("layout51");

    obj.rectangle54 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.layout51);
    obj.rectangle54:setColor("black");
    obj.rectangle54:setAlign("left");
    obj.rectangle54:setWidth(90);
    obj.rectangle54:setName("rectangle54");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.rectangle54);
    obj.label86:setText("Rebater");
    obj.label86:setWidth(90);
    obj.label86:setTop(5);
    obj.label86:setHorzTextAlign("center");
    obj.label86:setName("label86");

    obj.edit122 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout51);
    obj.edit122:setField("REB_MOD");
    obj.edit122:setAlign("left");
    obj.edit122:setMargins({left = 5});
    obj.edit122:setWidth(30);
    obj.edit122:setHorzTextAlign("center");
    obj.edit122:setReadOnly(true);
    obj.edit122:setName("edit122");

    obj.rectangle55 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.layout51);
    obj.rectangle55:setColor("black");
    obj.rectangle55:setAlign("left");
    obj.rectangle55:setWidth(90);
    obj.rectangle55:setMargins({left = 10});
    obj.rectangle55:setName("rectangle55");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.rectangle55);
    obj.label87:setText("Velocidade");
    obj.label87:setWidth(90);
    obj.label87:setTop(5);
    obj.label87:setHorzTextAlign("center");
    obj.label87:setName("label87");

    obj.edit123 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout51);
    obj.edit123:setField("VEL_MOD");
    obj.edit123:setAlign("left");
    obj.edit123:setMargins({left = 5});
    obj.edit123:setWidth(30);
    obj.edit123:setHorzTextAlign("center");
    obj.edit123:setReadOnly(true);
    obj.edit123:setName("edit123");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout49);
    obj.layout52:setHeight(30);
    obj.layout52:setAlign("top");
    obj.layout52:setMargins({top=3});
    obj.layout52:setName("layout52");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout52);
    obj.label88:setText("Pericias");
    obj.label88:setTop(5);
    obj.label88:setHorzTextAlign("center");
    obj.label88:setAlign("left");
    obj.label88:setName("label88");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout52);
    obj.label89:setText("Atr");
    obj.label89:setAlign("left");
    obj.label89:setMargins({left = 5});
    obj.label89:setWidth(30);
    obj.label89:setHorzTextAlign("center");
    obj.label89:setName("label89");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout52);
    obj.label90:setText("Grad");
    obj.label90:setAlign("left");
    obj.label90:setMargins({left = 5});
    obj.label90:setWidth(30);
    obj.label90:setHorzTextAlign("center");
    obj.label90:setName("label90");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout52);
    obj.label91:setText("Out");
    obj.label91:setAlign("left");
    obj.label91:setMargins({left = 5});
    obj.label91:setWidth(30);
    obj.label91:setHorzTextAlign("center");
    obj.label91:setName("label91");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout52);
    obj.label92:setText("Total");
    obj.label92:setAlign("left");
    obj.label92:setMargins({left = 5});
    obj.label92:setWidth(30);
    obj.label92:setHorzTextAlign("center");
    obj.label92:setName("label92");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout49);
    obj.layout53:setHeight(30);
    obj.layout53:setAlign("top");
    obj.layout53:setMargins({top=3});
    obj.layout53:setName("layout53");

    obj.rectangle56 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.layout53);
    obj.rectangle56:setColor("black");
    obj.rectangle56:setAlign("left");
    obj.rectangle56:setWidth(120);
    obj.rectangle56:setName("rectangle56");

    obj.ANTE_QUAD = GUI.fromHandle(_obj_newObject("label"));
    obj.ANTE_QUAD:setParent(obj.rectangle56);
    obj.ANTE_QUAD:setName("ANTE_QUAD");
    obj.ANTE_QUAD:setText("Antecipar");
    obj.ANTE_QUAD:setTop(5);
    obj.ANTE_QUAD:setHorzTextAlign("center");

    obj.edit124 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout53);
    obj.edit124:setField("SAB");
    obj.edit124:setAlign("left");
    obj.edit124:setMargins({left = 5});
    obj.edit124:setWidth(30);
    obj.edit124:setHorzTextAlign("center");
    obj.edit124:setReadOnly(true);
    obj.edit124:setName("edit124");

    obj.edit125 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout53);
    obj.edit125:setField("VEI_Grad");
    obj.edit125:setAlign("left");
    obj.edit125:setMargins({left = 5});
    obj.edit125:setWidth(30);
    obj.edit125:setHorzTextAlign("center");
    obj.edit125:setReadOnly(true);
    obj.edit125:setName("edit125");

    obj.edit126 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout53);
    obj.edit126:setField("ANTE_QUAD_OUT");
    obj.edit126:setAlign("left");
    obj.edit126:setMargins({left = 5});
    obj.edit126:setWidth(30);
    obj.edit126:setHorzTextAlign("center");
    obj.edit126:setName("edit126");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout53);
    obj.label93:setField("ANTE_QUAD_TOTAL");
    obj.label93:setAlign("left");
    obj.label93:setMargins({left = 5});
    obj.label93:setWidth(30);
    obj.label93:setHorzTextAlign("center");
    obj.label93:setName("label93");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout49);
    obj.layout54:setHeight(30);
    obj.layout54:setAlign("top");
    obj.layout54:setMargins({top=3});
    obj.layout54:setName("layout54");

    obj.rectangle57 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.layout54);
    obj.rectangle57:setColor("black");
    obj.rectangle57:setAlign("left");
    obj.rectangle57:setWidth(120);
    obj.rectangle57:setName("rectangle57");

    obj.APAN_QUAD = GUI.fromHandle(_obj_newObject("label"));
    obj.APAN_QUAD:setParent(obj.rectangle57);
    obj.APAN_QUAD:setName("APAN_QUAD");
    obj.APAN_QUAD:setText("Apanhar Pomo");
    obj.APAN_QUAD:setTop(5);
    obj.APAN_QUAD:setHorzTextAlign("center");

    obj.edit127 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout54);
    obj.edit127:setField("DES");
    obj.edit127:setAlign("left");
    obj.edit127:setMargins({left = 5});
    obj.edit127:setWidth(30);
    obj.edit127:setHorzTextAlign("center");
    obj.edit127:setReadOnly(true);
    obj.edit127:setName("edit127");

    obj.edit128 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout54);
    obj.edit128:setField("VEI_Grad");
    obj.edit128:setAlign("left");
    obj.edit128:setMargins({left = 5});
    obj.edit128:setWidth(30);
    obj.edit128:setHorzTextAlign("center");
    obj.edit128:setReadOnly(true);
    obj.edit128:setName("edit128");

    obj.edit129 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout54);
    obj.edit129:setField("APAN_QUAD_OUT");
    obj.edit129:setAlign("left");
    obj.edit129:setMargins({left = 5});
    obj.edit129:setWidth(30);
    obj.edit129:setHorzTextAlign("center");
    obj.edit129:setName("edit129");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout54);
    obj.label94:setField("APAN_QUAD_TOTAL");
    obj.label94:setAlign("left");
    obj.label94:setMargins({left = 5});
    obj.label94:setWidth(30);
    obj.label94:setHorzTextAlign("center");
    obj.label94:setName("label94");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.layout49);
    obj.layout55:setHeight(30);
    obj.layout55:setAlign("top");
    obj.layout55:setMargins({top=3});
    obj.layout55:setName("layout55");

    obj.rectangle58 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.layout55);
    obj.rectangle58:setColor("black");
    obj.rectangle58:setAlign("left");
    obj.rectangle58:setWidth(120);
    obj.rectangle58:setName("rectangle58");

    obj.ATRA_QUAD = GUI.fromHandle(_obj_newObject("label"));
    obj.ATRA_QUAD:setParent(obj.rectangle58);
    obj.ATRA_QUAD:setName("ATRA_QUAD");
    obj.ATRA_QUAD:setText("Atrapalhar");
    obj.ATRA_QUAD:setTop(5);
    obj.ATRA_QUAD:setHorzTextAlign("center");

    obj.edit130 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout55);
    obj.edit130:setField("INTE");
    obj.edit130:setAlign("left");
    obj.edit130:setMargins({left = 5});
    obj.edit130:setWidth(30);
    obj.edit130:setHorzTextAlign("center");
    obj.edit130:setReadOnly(true);
    obj.edit130:setName("edit130");

    obj.edit131 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout55);
    obj.edit131:setField("VEI_Grad");
    obj.edit131:setAlign("left");
    obj.edit131:setMargins({left = 5});
    obj.edit131:setWidth(30);
    obj.edit131:setHorzTextAlign("center");
    obj.edit131:setReadOnly(true);
    obj.edit131:setName("edit131");

    obj.edit132 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout55);
    obj.edit132:setField("ATRA_QUAD_OUT");
    obj.edit132:setAlign("left");
    obj.edit132:setMargins({left = 5});
    obj.edit132:setWidth(30);
    obj.edit132:setHorzTextAlign("center");
    obj.edit132:setName("edit132");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout55);
    obj.label95:setField("ATRA_QUAD_TOTAL");
    obj.label95:setAlign("left");
    obj.label95:setMargins({left = 5});
    obj.label95:setWidth(30);
    obj.label95:setHorzTextAlign("center");
    obj.label95:setName("label95");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.layout49);
    obj.layout56:setHeight(30);
    obj.layout56:setAlign("top");
    obj.layout56:setMargins({top=3});
    obj.layout56:setName("layout56");

    obj.rectangle59 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.layout56);
    obj.rectangle59:setColor("black");
    obj.rectangle59:setAlign("left");
    obj.rectangle59:setWidth(120);
    obj.rectangle59:setName("rectangle59");

    obj.DEFE_QUAD = GUI.fromHandle(_obj_newObject("label"));
    obj.DEFE_QUAD:setParent(obj.rectangle59);
    obj.DEFE_QUAD:setName("DEFE_QUAD");
    obj.DEFE_QUAD:setText("Defender");
    obj.DEFE_QUAD:setTop(5);
    obj.DEFE_QUAD:setHorzTextAlign("center");

    obj.edit133 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout56);
    obj.edit133:setField("AGI");
    obj.edit133:setAlign("left");
    obj.edit133:setMargins({left = 5});
    obj.edit133:setWidth(30);
    obj.edit133:setHorzTextAlign("center");
    obj.edit133:setReadOnly(true);
    obj.edit133:setName("edit133");

    obj.edit134 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout56);
    obj.edit134:setField("VEI_Grad");
    obj.edit134:setAlign("left");
    obj.edit134:setMargins({left = 5});
    obj.edit134:setWidth(30);
    obj.edit134:setHorzTextAlign("center");
    obj.edit134:setReadOnly(true);
    obj.edit134:setName("edit134");

    obj.edit135 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout56);
    obj.edit135:setField("DEFE_QUAD_OUT");
    obj.edit135:setAlign("left");
    obj.edit135:setMargins({left = 5});
    obj.edit135:setWidth(30);
    obj.edit135:setHorzTextAlign("center");
    obj.edit135:setName("edit135");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout56);
    obj.label96:setField("DEFE_QUAD_TOTAL");
    obj.label96:setAlign("left");
    obj.label96:setMargins({left = 5});
    obj.label96:setWidth(30);
    obj.label96:setHorzTextAlign("center");
    obj.label96:setName("label96");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout49);
    obj.layout57:setHeight(30);
    obj.layout57:setAlign("top");
    obj.layout57:setMargins({top=3});
    obj.layout57:setName("layout57");

    obj.rectangle60 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.layout57);
    obj.rectangle60:setColor("black");
    obj.rectangle60:setAlign("left");
    obj.rectangle60:setWidth(120);
    obj.rectangle60:setName("rectangle60");

    obj.DRI_QUAD = GUI.fromHandle(_obj_newObject("label"));
    obj.DRI_QUAD:setParent(obj.rectangle60);
    obj.DRI_QUAD:setName("DRI_QUAD");
    obj.DRI_QUAD:setText("Driblar");
    obj.DRI_QUAD:setTop(5);
    obj.DRI_QUAD:setHorzTextAlign("center");

    obj.edit136 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout57);
    obj.edit136:setField("AGI");
    obj.edit136:setAlign("left");
    obj.edit136:setMargins({left = 5});
    obj.edit136:setWidth(30);
    obj.edit136:setHorzTextAlign("center");
    obj.edit136:setReadOnly(true);
    obj.edit136:setName("edit136");

    obj.edit137 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout57);
    obj.edit137:setField("VEI_Grad");
    obj.edit137:setAlign("left");
    obj.edit137:setMargins({left = 5});
    obj.edit137:setWidth(30);
    obj.edit137:setHorzTextAlign("center");
    obj.edit137:setReadOnly(true);
    obj.edit137:setName("edit137");

    obj.edit138 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout57);
    obj.edit138:setField("DRI_QUAD_OUT");
    obj.edit138:setAlign("left");
    obj.edit138:setMargins({left = 5});
    obj.edit138:setWidth(30);
    obj.edit138:setHorzTextAlign("center");
    obj.edit138:setName("edit138");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout57);
    obj.label97:setField("DRI_QUAD_TOTAL");
    obj.label97:setAlign("left");
    obj.label97:setMargins({left = 5});
    obj.label97:setWidth(30);
    obj.label97:setHorzTextAlign("center");
    obj.label97:setName("label97");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.layout49);
    obj.layout58:setHeight(30);
    obj.layout58:setAlign("top");
    obj.layout58:setMargins({top=3});
    obj.layout58:setName("layout58");

    obj.rectangle61 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.layout58);
    obj.rectangle61:setColor("black");
    obj.rectangle61:setAlign("left");
    obj.rectangle61:setWidth(120);
    obj.rectangle61:setName("rectangle61");

    obj.GOL_QUAD = GUI.fromHandle(_obj_newObject("label"));
    obj.GOL_QUAD:setParent(obj.rectangle61);
    obj.GOL_QUAD:setName("GOL_QUAD");
    obj.GOL_QUAD:setText("Golear");
    obj.GOL_QUAD:setTop(5);
    obj.GOL_QUAD:setHorzTextAlign("center");

    obj.edit139 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout58);
    obj.edit139:setField("FOR");
    obj.edit139:setAlign("left");
    obj.edit139:setMargins({left = 5});
    obj.edit139:setWidth(30);
    obj.edit139:setHorzTextAlign("center");
    obj.edit139:setReadOnly(true);
    obj.edit139:setName("edit139");

    obj.edit140 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout58);
    obj.edit140:setField("VEI_Grad");
    obj.edit140:setAlign("left");
    obj.edit140:setMargins({left = 5});
    obj.edit140:setWidth(30);
    obj.edit140:setHorzTextAlign("center");
    obj.edit140:setReadOnly(true);
    obj.edit140:setName("edit140");

    obj.edit141 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout58);
    obj.edit141:setField("GOL_QUAD_OUT");
    obj.edit141:setAlign("left");
    obj.edit141:setMargins({left = 5});
    obj.edit141:setWidth(30);
    obj.edit141:setHorzTextAlign("center");
    obj.edit141:setName("edit141");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout58);
    obj.label98:setField("GOL_QUAD_TOTAL");
    obj.label98:setAlign("left");
    obj.label98:setMargins({left = 5});
    obj.label98:setWidth(30);
    obj.label98:setHorzTextAlign("center");
    obj.label98:setName("label98");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.layout49);
    obj.layout59:setHeight(30);
    obj.layout59:setAlign("top");
    obj.layout59:setMargins({top=3});
    obj.layout59:setName("layout59");

    obj.rectangle62 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle62:setParent(obj.layout59);
    obj.rectangle62:setColor("black");
    obj.rectangle62:setAlign("left");
    obj.rectangle62:setWidth(120);
    obj.rectangle62:setName("rectangle62");

    obj.FALTA_QUAD = GUI.fromHandle(_obj_newObject("label"));
    obj.FALTA_QUAD:setParent(obj.rectangle62);
    obj.FALTA_QUAD:setName("FALTA_QUAD");
    obj.FALTA_QUAD:setText("Marcar Falta");
    obj.FALTA_QUAD:setTop(5);
    obj.FALTA_QUAD:setHorzTextAlign("center");

    obj.edit142 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout59);
    obj.edit142:setField("PRE");
    obj.edit142:setAlign("left");
    obj.edit142:setMargins({left = 5});
    obj.edit142:setWidth(30);
    obj.edit142:setHorzTextAlign("center");
    obj.edit142:setReadOnly(true);
    obj.edit142:setName("edit142");

    obj.edit143 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout59);
    obj.edit143:setField("VEI_Grad");
    obj.edit143:setAlign("left");
    obj.edit143:setMargins({left = 5});
    obj.edit143:setWidth(30);
    obj.edit143:setHorzTextAlign("center");
    obj.edit143:setReadOnly(true);
    obj.edit143:setName("edit143");

    obj.edit144 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout59);
    obj.edit144:setField("FALTA_QUAD_OUT");
    obj.edit144:setAlign("left");
    obj.edit144:setMargins({left = 5});
    obj.edit144:setWidth(30);
    obj.edit144:setHorzTextAlign("center");
    obj.edit144:setName("edit144");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout59);
    obj.label99:setField("FALTA_QUAD_TOTAL");
    obj.label99:setAlign("left");
    obj.label99:setMargins({left = 5});
    obj.label99:setWidth(30);
    obj.label99:setHorzTextAlign("center");
    obj.label99:setName("label99");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.layout49);
    obj.layout60:setHeight(30);
    obj.layout60:setAlign("top");
    obj.layout60:setMargins({top=3});
    obj.layout60:setName("layout60");

    obj.rectangle63 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle63:setParent(obj.layout60);
    obj.rectangle63:setColor("black");
    obj.rectangle63:setAlign("left");
    obj.rectangle63:setWidth(120);
    obj.rectangle63:setName("rectangle63");

    obj.PASS_QUAD = GUI.fromHandle(_obj_newObject("label"));
    obj.PASS_QUAD:setParent(obj.rectangle63);
    obj.PASS_QUAD:setName("PASS_QUAD");
    obj.PASS_QUAD:setText("Passar a Bola");
    obj.PASS_QUAD:setTop(5);
    obj.PASS_QUAD:setHorzTextAlign("center");

    obj.edit145 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout60);
    obj.edit145:setField("FOR");
    obj.edit145:setAlign("left");
    obj.edit145:setMargins({left = 5});
    obj.edit145:setWidth(30);
    obj.edit145:setHorzTextAlign("center");
    obj.edit145:setReadOnly(true);
    obj.edit145:setName("edit145");

    obj.edit146 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout60);
    obj.edit146:setField("VEI_Grad");
    obj.edit146:setAlign("left");
    obj.edit146:setMargins({left = 5});
    obj.edit146:setWidth(30);
    obj.edit146:setHorzTextAlign("center");
    obj.edit146:setReadOnly(true);
    obj.edit146:setName("edit146");

    obj.edit147 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout60);
    obj.edit147:setField("PASS_QUAD_OUT");
    obj.edit147:setAlign("left");
    obj.edit147:setMargins({left = 5});
    obj.edit147:setWidth(30);
    obj.edit147:setHorzTextAlign("center");
    obj.edit147:setName("edit147");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout60);
    obj.label100:setField("PASS_QUAD_TOTAL");
    obj.label100:setAlign("left");
    obj.label100:setMargins({left = 5});
    obj.label100:setWidth(30);
    obj.label100:setHorzTextAlign("center");
    obj.label100:setName("label100");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.layout49);
    obj.layout61:setHeight(30);
    obj.layout61:setAlign("top");
    obj.layout61:setMargins({top=3});
    obj.layout61:setName("layout61");

    obj.rectangle64 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle64:setParent(obj.layout61);
    obj.rectangle64:setColor("black");
    obj.rectangle64:setAlign("left");
    obj.rectangle64:setWidth(120);
    obj.rectangle64:setName("rectangle64");

    obj.REBA_QUAD = GUI.fromHandle(_obj_newObject("label"));
    obj.REBA_QUAD:setParent(obj.rectangle64);
    obj.REBA_QUAD:setName("REBA_QUAD");
    obj.REBA_QUAD:setText("Rebater Balasso");
    obj.REBA_QUAD:setTop(5);
    obj.REBA_QUAD:setHorzTextAlign("center");

    obj.edit148 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout61);
    obj.edit148:setField("FOR");
    obj.edit148:setAlign("left");
    obj.edit148:setMargins({left = 5});
    obj.edit148:setWidth(30);
    obj.edit148:setHorzTextAlign("center");
    obj.edit148:setReadOnly(true);
    obj.edit148:setName("edit148");

    obj.edit149 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout61);
    obj.edit149:setField("VEI_Grad");
    obj.edit149:setAlign("left");
    obj.edit149:setMargins({left = 5});
    obj.edit149:setWidth(30);
    obj.edit149:setHorzTextAlign("center");
    obj.edit149:setReadOnly(true);
    obj.edit149:setName("edit149");

    obj.edit150 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout61);
    obj.edit150:setField("REBA_QUAD_OUT");
    obj.edit150:setAlign("left");
    obj.edit150:setMargins({left = 5});
    obj.edit150:setWidth(30);
    obj.edit150:setHorzTextAlign("center");
    obj.edit150:setName("edit150");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout61);
    obj.label101:setField("REBA_QUAD_TOTAL");
    obj.label101:setAlign("left");
    obj.label101:setMargins({left = 5});
    obj.label101:setWidth(30);
    obj.label101:setHorzTextAlign("center");
    obj.label101:setName("label101");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.layout49);
    obj.layout62:setHeight(30);
    obj.layout62:setAlign("top");
    obj.layout62:setMargins({top=3});
    obj.layout62:setName("layout62");

    obj.rectangle65 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle65:setParent(obj.layout62);
    obj.rectangle65:setColor("black");
    obj.rectangle65:setAlign("left");
    obj.rectangle65:setWidth(120);
    obj.rectangle65:setName("rectangle65");

    obj.ROU_QUAD = GUI.fromHandle(_obj_newObject("label"));
    obj.ROU_QUAD:setParent(obj.rectangle65);
    obj.ROU_QUAD:setName("ROU_QUAD");
    obj.ROU_QUAD:setText("Roubar a bola");
    obj.ROU_QUAD:setTop(5);
    obj.ROU_QUAD:setHorzTextAlign("center");

    obj.edit151 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout62);
    obj.edit151:setField("LUT");
    obj.edit151:setAlign("left");
    obj.edit151:setMargins({left = 5});
    obj.edit151:setWidth(30);
    obj.edit151:setHorzTextAlign("center");
    obj.edit151:setReadOnly(true);
    obj.edit151:setName("edit151");

    obj.edit152 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout62);
    obj.edit152:setField("VEI_Grad");
    obj.edit152:setAlign("left");
    obj.edit152:setMargins({left = 5});
    obj.edit152:setWidth(30);
    obj.edit152:setHorzTextAlign("center");
    obj.edit152:setReadOnly(true);
    obj.edit152:setName("edit152");

    obj.edit153 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout62);
    obj.edit153:setField("ROU_QUAD_OUT");
    obj.edit153:setAlign("left");
    obj.edit153:setMargins({left = 5});
    obj.edit153:setWidth(30);
    obj.edit153:setHorzTextAlign("center");
    obj.edit153:setName("edit153");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout62);
    obj.label102:setField("ROU_QUAD_TOTAL");
    obj.label102:setAlign("left");
    obj.label102:setMargins({left = 5});
    obj.label102:setWidth(30);
    obj.label102:setHorzTextAlign("center");
    obj.label102:setName("label102");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.layout49);
    obj.layout63:setHeight(30);
    obj.layout63:setAlign("top");
    obj.layout63:setMargins({top=3});
    obj.layout63:setName("layout63");

    obj.rectangle66 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle66:setParent(obj.layout63);
    obj.rectangle66:setColor("black");
    obj.rectangle66:setAlign("left");
    obj.rectangle66:setWidth(120);
    obj.rectangle66:setName("rectangle66");

    obj.VEL_QUAD = GUI.fromHandle(_obj_newObject("label"));
    obj.VEL_QUAD:setParent(obj.rectangle66);
    obj.VEL_QUAD:setName("VEL_QUAD");
    obj.VEL_QUAD:setText("Velocidade");
    obj.VEL_QUAD:setTop(5);
    obj.VEL_QUAD:setHorzTextAlign("center");

    obj.edit154 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout63);
    obj.edit154:setField("AGI");
    obj.edit154:setAlign("left");
    obj.edit154:setMargins({left = 5});
    obj.edit154:setWidth(30);
    obj.edit154:setHorzTextAlign("center");
    obj.edit154:setReadOnly(true);
    obj.edit154:setName("edit154");

    obj.edit155 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout63);
    obj.edit155:setField("VEI_Grad");
    obj.edit155:setAlign("left");
    obj.edit155:setMargins({left = 5});
    obj.edit155:setWidth(30);
    obj.edit155:setHorzTextAlign("center");
    obj.edit155:setReadOnly(true);
    obj.edit155:setName("edit155");

    obj.edit156 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout63);
    obj.edit156:setField("VEL_QUAD_OUT");
    obj.edit156:setAlign("left");
    obj.edit156:setMargins({left = 5});
    obj.edit156:setWidth(30);
    obj.edit156:setHorzTextAlign("center");
    obj.edit156:setName("edit156");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout63);
    obj.label103:setField("VEL_QUAD_TOTAL");
    obj.label103:setAlign("left");
    obj.label103:setMargins({left = 5});
    obj.label103:setWidth(30);
    obj.label103:setHorzTextAlign("center");
    obj.label103:setName("label103");

    obj.tab9 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab9:setParent(obj.tabControl1);
    obj.tab9:setTitle("Feitiços");
    obj.tab9:setName("tab9");


    -- Primeiro, é necessário usar a unidade "dialogs.lua"
    require("dialogs.lua");
    require("ndb.lua")
    require("utils.lua");
    local node = NDB.getRoot(sheet)

    local function abrirPopUp()
    require("gui.lua");

    local node = NDB.getRoot(sheet)

    local controle = self:findControlByName("popUp");
    controle.visible = true

    local Raiz = NDB.load("listfetico.xml");
    local Filho = NDB.getChildNodes(Raiz);
    local node = NDB.getRoot(sheet)

    ListaFeiticos = {}
    ListaNomesFeitico = {}

    for i = 1, #Filho, 1 do
    ListaFeiticos[i] = Raiz["f" .. i]
    ListaNomesFeitico[i] = Raiz["f" .. i].nome
    table.sort(ListaNomesFeitico)
    end

    for k = 1, #Filho, 1 do

    if sheet.nome == ListaFeiticos[i].nome then

    node.escola2 = ListaFeiticos[i].escola
    node.tipo2 = ListaFeiticos[i].cast
    node.Efeito2 = ListaFeiticos[i].efeito
    node.Grad2 = totable(ListaFeiticos[i].gradArray)[1]
    node.CD2 = totable(ListaFeiticos[i].cdfArray)[1]
    node.Dano2 = totable(ListaFeiticos[i].danoArray)[1]
    node.Poder2 = totable(ListaFeiticos[i].poderArray)[1]
    node.Range2 = totable(ListaFeiticos[i].rangeArray)[1]
    node.Area2 = totable(ListaFeiticos[i].areaArray)[1]
    node.Duracao2 = totable(ListaFeiticos[i].duracaoArray)[1]

    node.escola = sheet.escola
    node.tipo = sheet.tipo
    node.Grad = sheet.Grad
    node.CD = sheet.CD
    node.Dano = sheet.Dano
    node.Poder = sheet.Poder
    node.Range = sheet.Range
    node.Area = sheet.Area
    node.Duracao = sheet.escola

    node.Desc = ListaFeiticos[i].desc
    node.Efeito = ListaFeiticos[i].efeito
    node.Bonus = ListaFeiticos[i].bonus

    end
    end

    end

    local function condition(tipo)

    if tipo == "fisico" then

    if sheet.Exausto then
    return -5
    end

    if sheet.Fadigado then
    return -2
    end

    elseif tipo == "mental" then

    if sheet.Tiltado then
    return -5
    end

    if sheet.Frustrado then
    return -2
    end

    end

    return nil
    end

    local function testezz()

    local node = NDB.getRoot(sheet)
    showMessage(node.soundControl)

    end

    local function tocarAudio()
    require("utils.lua");

    local minhaMesa = Firecast.getRoomOf(sheet);
    local node = NDB.getRoot(sheet)

    if node.soundControl == "ligado" then

    if sheet.Sound ~= nil then
    local track = "/audios/" .. sheet.Sound
    minhaMesa.audioPlayer:play(track,0.8)
    end

    end

    end

    local function Aceitar()
    Dialogs.confirmOkCancel("Deseja Apagar esse Feitiço ?",
    function (confirmado)
    if confirmado then
    local node = self.boxDetalhesDoItem.node
    NDB.deleteNode(node);
    else
    return
    end;
    end);

    end

    local function definirEscola()
    local node = self.rclMagias.selectedNode;

    if node.escola == 'Adivinhação' then
    return sheet.C_ADI_Total
    elseif node.escola == 'Azaração' then
    return sheet.C_AZA_Total
    elseif node.escola == 'Contra-Feitiço' then
    return sheet.C_CON_Total
    elseif node.escola == 'Encantamento' then
    return sheet.C_ENC_Total
    elseif node.escola == 'Feitiço' then
    return sheet.C_FEI_Total
    elseif node.escola == 'Transmutação' then
    return sheet.C_TRA_Total
    elseif node.escola == 'Maldição' then
    return sheet.C_MAL_Total
    end

    end

    local function stats()
    local node = self.rclMagias.selectedNode;
    local msg = ""

    if node.Grad ~= "" then
    msg = msg .. "[§K10]" .. "Grad: " .. "[§K1]" .. ((node.Grad) or "")
    else
    end

    if node.CD ~= "" then
    msg = msg .. "[§K10]" .. " CD: " .. "[§K1]" .. ((node.CD) or "")
    else
    end

    if node.Dano ~= "" then
    msg = msg .. "[§K10]" .. " Dano: " .. "[§K1]" .. ((node.Dano) or "")
    else
    end

    if node.Poder ~= "" then
    msg = msg .. "[§K10]" .. " Poder: " .. "[§K1]" .. ((node.Poder) or "")
    else
    end

    -- if node.Bonus ~= "" then
    -- msg = msg .. "[§K10]" .. " Bonus: " .. "[§K1]" .. ((node.Bonus) or "")
    -- else
    -- end

    if node.Range ~= "" then
    msg = msg .. "[§K10]" .. " Range: " .. "[§K1]" .. ((node.Range) or "")
    else
    end

    if node.Area ~= "" then
    msg = msg .. "[§K10]" .. " Area: " .. "[§K1]" .. ((node.Area) or "")
    else
    end

    if node.Duracao ~= "" then
    msg = msg .. "[§K10]" .. " Duração: " .. "[§K1]" .. ((node.Duracao) or "")
    else
    end

    return msg
    end

    local function rolarFeitico()
    local minhaMesa = Firecast.getRoomOf(sheet);
    local chat = minhaMesa.chat;
    local root = NDB.getRoot(sheet)
    local nick = root.nomePersonagem or minhaMesa.meuJogador.nick
    local node = self.rclMagias.selectedNode;
    local dataScope = self.boxDetalhesDoItem.node
    local defesaTipo = "Distancia"
    local defesaValor = 0

    if sheet.concentracao == nil then
    sheet.concentracao = 0
    end

    if sheet.mental == nil then
    sheet.mental = 0
    end

    local somatoria = node.Grad .. "+" .. math.floor(definirEscola() / 2) .. ((sheet.concentracao ~=
    0) and
    ("-" .. sheet.concentracao) or "") .. (condition("mental") or "")
    chat:enviarMensagem("----------------");

    chat:rolarDados("1d20+" .. somatoria,
    "[§K8] Grad [§K1]" .. node.Grad ..
    ((definirEscola() / 2) ~= 0 and ("[§K8] Escola [§K1]" .. math.floor(definirEscola() / 2)) or "")
    ..
    (sheet.concentracao ~= 0 and ("[§K8] Concentração [§K1] -" ..
    sheet.concentracao) or "") ..
    (condition("mental") and ("[§K8] Mental [§K1]" .. condition("mental")) or ""),
    function(rolagem)

    if rolagem.resultado >= tonumber(node.CD) then
    chat:enviarMensagem("[§K10]" .. nick .. "[§K1] esta castando [§K6]" .. node.nome ..
    "[§K1] CD [§K7]" .. sheet.CD .. "[§K1] =[§K9] Sucesso!")

    chat:enviarMensagem("[§K6]" .. node.nome .. " " .. stats())
    chat:enviarMensagem("[§K1]" .. "Testes: [§K10]" .. (node.defesa or ""))

    if node.tipo == 'Ataque' then
    chat:rolarDados("1d20+" .. node.Grad .. "+" .. sheet.DES ..
    (sheet.acerto and sheet.acerto ~= 0 and ("-" .. sheet.acerto) or "") ..
    (condition("fisico") or ""),

    "[§K8] Grad [§K1]" .. node.Grad ..
    "[§K8] Des [§K1]" .. sheet.DES ..
    (sheet.acerto and sheet.acerto ~= 0 and ("[§K8] Acerto [§K1]-" .. sheet.acerto) or "") ..
    (condition("fisico") and ("[§K8] Fisico [§K1]" .. condition("fisico")) or ""))

    elseif node.tipo == 'Ataque Base' then
    chat:rolarDados("1d20+" .. node.Grad .. "+" .. sheet.DES .. ((sheet.acerto ~= 0) and ("-"
    ..sheet.acerto) or "") ..
    (condition("fisico") or ""),

    "[§K8] Grad [§K1]" .. node.Grad ..
    "[§K8] Des [§K1]" .. sheet.DES ..
    (sheet.acerto and sheet.acerto ~= 0 and ("[§K8] Acerto [§K1]-" .. sheet.acerto) or "") ..
    (condition("fisico") and ("[§K8] Fisico [§K1]" .. condition("fisico")) or ""))

    elseif node.tipo == 'Defesa' then

    Dialogs.choose("Ataque Corpo-a-Corpo ou a Distancia ?", {"Corpo-a-Corpo", "Distancia"}, function(selected, selectedIndex, selectedText)
    local nodeMain = NDB.getRoot(sheet)

    if selectedText == "Corpo-a-Corpo" then
    defesaValor = tonumber(nodeMain.APA_Total) or 0
    defesaTipo = "Corpo-a-Corpo"
    end

    if selectedText == "Distancia" then
    defesaValor = tonumber(nodeMain.REF_Total) or 0
    defesaTipo = "Distancia"
    end

    chat:rolarDados("1d8+" .. node.Poder .. "+" .. defesaValor .. "+" .. 10 ..
    (condition("fisico") or ""), "CA " .. node.nome .. " " .. defesaTipo)
    end)
    end

    chat:enviarMensagem("----------------");

    elseif rolagem.resultado > tonumber(node.CD) - 5 then
    chat:enviarMensagem("[§K11]" .. nick .. " - [§K6]" .. node.nome .. "[§K1] CD [§K7]" .. node.CD ..
    "[§K4] Falhou em 1 Estágio!!");

    elseif rolagem.resultado > tonumber(node.CD) - 10 then
    chat:enviarMensagem("[§K11]" .. nick .. " - [§K6]" .. node.nome .. "[§K1] CD [§K7]" .. node.CD ..
    "[§K4] Falhou em 2 Estágio!!");

    elseif rolagem.resultado > tonumber(node.CD) - 15 then
    chat:enviarMensagem("[§K11]" .. nick .. " - [§K6]" .. node.nome .. "[§K1] CD [§K7]" .. node.CD ..
    "[§K4] Falhou em 3 Estágio!!");

    else
    chat:enviarMensagem("[§K11]" .. nick .. " - [§K6]" .. node.nome .. "[§K1] CD [§K7]" .. node.CD ..
    "[§K4] Falhou em 4 Estágio!!");


    end

    end)

    end

    -- FUNÇÂO DE FEITICO
    local function ListaDeFeitico()

    require("utils.lua");
    local Raiz = NDB.load("listfetico.xml");
    local Filho = NDB.getChildNodes(Raiz);
    local node = self.rclMagias.selectedNode;

    ListaFeiticos = {} -- new array
    ListaNomesFeitico = {} -- new array

    for i = 1, #Filho, 1 do
    ListaFeiticos[i] = Raiz["f" .. i]
    ListaNomesFeitico[i] = Raiz["f" .. i].nome
    table.sort(ListaNomesFeitico)
    end

    Dialogs.choose("Selecione uma das opções", ListaNomesFeitico,
    function(selected, selectedIndex, selectedText)
    if selected then

    for k = 1, #Filho, 1 do
    if tostring(selectedText) == ListaFeiticos[k].nome then

    sheet.nome = ListaFeiticos[k].nome
    sheet.escola = ListaFeiticos[k].escola
    sheet.defesa = ListaFeiticos[k].defesa
    sheet.tipo = ListaFeiticos[k].cast
    sheet.Efeito = ListaFeiticos[k].efeito
    sheet.Desc = ListaFeiticos[k].desc

    node.nome = ListaFeiticos[k].nome
    node.escola = ListaFeiticos[k].escola
    node.defesa = ListaFeiticos[k].defesa
    node.tipo = ListaFeiticos[k].cast
    node.Efeito = ListaFeiticos[k].efeito
    node.Desc = ListaFeiticos[k].desc


    sheet.Grad = totable(ListaFeiticos[k].gradArray)[1]
    sheet.Grad_name = "Grad"
    sheet.Grad_grad = 1
    sheet.Grad_array = ListaFeiticos[k].gradArray

    sheet.CD = totable(ListaFeiticos[k].cdfArray)[1]
    sheet.CD_name = "CD"
    sheet.CD_grad = 1
    sheet.CD_array = ListaFeiticos[k].cdfArray

    sheet.Dano = totable(ListaFeiticos[k].danoArray)[1]
    sheet.Dano_name = "Dano"
    sheet.Dano_grad = 1
    sheet.Dano_array = ListaFeiticos[k].danoArray

    sheet.Poder = totable(ListaFeiticos[k].poderArray)[1]
    sheet.Poder_name = "Poder"
    sheet.Poder_grad = 1
    sheet.Poder_array = ListaFeiticos[k].poderArray

    sheet.Range = totable(ListaFeiticos[k].rangeArray)[1]
    sheet.Range_name = "Range"
    sheet.Range_grad = 1
    sheet.Range_array = ListaFeiticos[k].rangeArray

    sheet.Area = totable(ListaFeiticos[k].areaArray)[1]
    sheet.Area_name = "Area"
    sheet.Area_grad = 1
    sheet.Area_array = ListaFeiticos[k].areaArray

    sheet.Duracao = totable(ListaFeiticos[k].duracaoArray)[1]
    sheet.Duracao_name = "Duracao"
    sheet.Duracao_grad = 1
    sheet.Duracao_array = ListaFeiticos[k].duracaoArray

    node.Grad = totable(ListaFeiticos[k].gradArray)[1]
    node.Grad_name = "Grad"
    node.Grad_grad = 1
    node.Grad_array = ListaFeiticos[k].gradArray

    node.CD = totable(ListaFeiticos[k].cdfArray)[1]
    node.CD_name = "CD"
    node.CD_grad = 1
    node.CD_array = ListaFeiticos[k].cdfArray

    node.Dano = totable(ListaFeiticos[k].danoArray)[1]
    node.Dano_name = "Dano"
    node.Dano_grad = 1
    node.Dano_array = ListaFeiticos[k].danoArray

    node.Poder = totable(ListaFeiticos[k].poderArray)[1]
    node.Poder_name = "Poder"
    node.Poder_grad = 1
    node.Poder_array = ListaFeiticos[k].poderArray

    node.Range = totable(ListaFeiticos[k].rangeArray)[1]
    node.Range_name = "Range"
    node.Range_grad = 1
    node.Range_array = ListaFeiticos[k].rangeArray

    node.Area = totable(ListaFeiticos[k].areaArray)[1]
    node.Area_name = "Area"
    node.Area_grad = 1
    node.Area_array = ListaFeiticos[k].areaArray

    node.Duracao = totable(ListaFeiticos[k].duracaoArray)[1]
    node.Duracao_name = "Duracao"
    node.Duracao_grad = 1
    node.Duracao_array = ListaFeiticos[k].duracaoArray

    end
    end
    else
    end;
    end)
    end

  


    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.tab9);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox3);
    obj.image2:setStyle("autoFit");
    obj.image2:setTop(0);
    obj.image2:setWidth(1300);
    obj.image2:setHeight(800);
    obj.image2:setSRC("/imagens/wizard.jpg");
    obj.image2:setName("image2");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.scrollBox3);
    obj.layout64:setAlign("top");
    obj.layout64:setHeight(100);
    obj.layout64:setPadding({top=5, left=5});
    obj.layout64:setName("layout64");


        local function adicionarFeitico()

        local node = self.rclMagias:append();

        node.nome = "Importar"
        node.escola = "-"
        node.tipo = "-"
        node.Efeito = "-"

        node.Grad = 0
        node.Grad_name = "Grad"
        node.Grad_grad = 1
        node.Grad_array = {0}

        node.CD = "-"
        node.CD_name = "CD"
        node.CD_grad = 1
        node.CD_array = {0}

        node.Dano = "-"
        node.Dano_name = "Dano"
        node.Dano_grad = 1
        node.Dano_array = {"-"}

        node.Poder = "-"
        node.Poder_name = "Poder"
        node.Poder_grad = 1
        node.Poder_array = {"-"}

        node.Range = "-"
        node.Range_name = "Range"
        node.Range_grad = 1
        node.Range_array = {"-"}

        node.Area = "-"
        node.Area_name = "Area"
        node.Area_grad = 1
        node.Area_array = {"-"}

        node.Duracao = "-"
        node.Duracao_name = "Duracao"
        node.Duracao_grad = 1
        node.Duracao_array = {"-"}

        end
      


    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.layout64);
    obj.layout65:setAlign("top");
    obj.layout65:setHeight(70);
    obj.layout65:setMargins({top=10, left=0});
    obj.layout65:setName("layout65");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.layout65);
    obj.layout66:setAlign("left");
    obj.layout66:setMargins({left=20});
    obj.layout66:setWidth(120);
    obj.layout66:setHeight(70);
    obj.layout66:setName("layout66");

    obj.rectangle67 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle67:setParent(obj.layout66);
    obj.rectangle67:setTop(5);
    obj.rectangle67:setLeft(10);
    obj.rectangle67:setColor("#C59E01");
    obj.rectangle67:setWidth(90);
    obj.rectangle67:setHeight(25);
    obj.rectangle67:setName("rectangle67");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.rectangle67);
    obj.label104:setAlign("client");
    obj.label104:setText("Destreza");
    obj.label104:setHorzTextAlign("center");
    obj.label104:setName("label104");

    obj.edit157 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout66);
    obj.edit157:setTop(30);
    obj.edit157:setWidth(120);
    obj.edit157:setField("DES");
    obj.edit157:setReadOnly(true);
    obj.edit157:setHorzTextAlign("center");
    obj.edit157:setType("number");
    obj.edit157:setMin(0);
    obj.edit157:setName("edit157");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.layout65);
    obj.layout67:setAlign("left");
    obj.layout67:setMargins({left=20});
    obj.layout67:setWidth(120);
    obj.layout67:setHeight(70);
    obj.layout67:setName("layout67");

    obj.rectangle68 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle68:setParent(obj.layout67);
    obj.rectangle68:setTop(5);
    obj.rectangle68:setLeft(10);
    obj.rectangle68:setColor("DarkSlateBlue");
    obj.rectangle68:setWidth(90);
    obj.rectangle68:setHeight(25);
    obj.rectangle68:setName("rectangle68");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.rectangle68);
    obj.label105:setAlign("client");
    obj.label105:setText("Adivinhação");
    obj.label105:setHorzTextAlign("center");
    obj.label105:setName("label105");

    obj.edit158 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout67);
    obj.edit158:setTop(30);
    obj.edit158:setWidth(120);
    obj.edit158:setField("C_ADI_Total");
    obj.edit158:setReadOnly(true);
    obj.edit158:setHorzTextAlign("center");
    obj.edit158:setType("number");
    obj.edit158:setMin(0);
    obj.edit158:setName("edit158");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.layout65);
    obj.layout68:setAlign("left");
    obj.layout68:setMargins({left=20});
    obj.layout68:setWidth(120);
    obj.layout68:setHeight(70);
    obj.layout68:setName("layout68");

    obj.rectangle69 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle69:setParent(obj.layout68);
    obj.rectangle69:setTop(5);
    obj.rectangle69:setLeft(10);
    obj.rectangle69:setColor("DarkSlateBlue");
    obj.rectangle69:setWidth(90);
    obj.rectangle69:setHeight(25);
    obj.rectangle69:setName("rectangle69");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.rectangle69);
    obj.label106:setAlign("client");
    obj.label106:setText("Azaração");
    obj.label106:setHorzTextAlign("center");
    obj.label106:setName("label106");

    obj.edit159 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout68);
    obj.edit159:setTop(30);
    obj.edit159:setWidth(120);
    obj.edit159:setField("C_AZA_Total");
    obj.edit159:setReadOnly(true);
    obj.edit159:setHorzTextAlign("center");
    obj.edit159:setType("number");
    obj.edit159:setMin(0);
    obj.edit159:setName("edit159");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.layout65);
    obj.layout69:setAlign("left");
    obj.layout69:setMargins({left=20});
    obj.layout69:setWidth(120);
    obj.layout69:setHeight(70);
    obj.layout69:setName("layout69");

    obj.rectangle70 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle70:setParent(obj.layout69);
    obj.rectangle70:setTop(5);
    obj.rectangle70:setLeft(10);
    obj.rectangle70:setColor("DarkSlateBlue");
    obj.rectangle70:setWidth(90);
    obj.rectangle70:setHeight(25);
    obj.rectangle70:setName("rectangle70");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.rectangle70);
    obj.label107:setAlign("client");
    obj.label107:setText("Contra-Feitiço");
    obj.label107:setHorzTextAlign("center");
    obj.label107:setName("label107");

    obj.edit160 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout69);
    obj.edit160:setTop(30);
    obj.edit160:setWidth(120);
    obj.edit160:setField("C_CON_Total");
    obj.edit160:setReadOnly(true);
    obj.edit160:setHorzTextAlign("center");
    obj.edit160:setType("number");
    obj.edit160:setMin(0);
    obj.edit160:setName("edit160");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.layout65);
    obj.layout70:setAlign("left");
    obj.layout70:setMargins({left=20});
    obj.layout70:setWidth(120);
    obj.layout70:setHeight(70);
    obj.layout70:setName("layout70");

    obj.rectangle71 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle71:setParent(obj.layout70);
    obj.rectangle71:setTop(5);
    obj.rectangle71:setLeft(10);
    obj.rectangle71:setColor("DarkSlateBlue");
    obj.rectangle71:setWidth(90);
    obj.rectangle71:setHeight(25);
    obj.rectangle71:setName("rectangle71");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.rectangle71);
    obj.label108:setAlign("client");
    obj.label108:setText("Encantamento");
    obj.label108:setHorzTextAlign("center");
    obj.label108:setName("label108");

    obj.edit161 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout70);
    obj.edit161:setTop(30);
    obj.edit161:setWidth(120);
    obj.edit161:setField("C_ENC_Total");
    obj.edit161:setReadOnly(true);
    obj.edit161:setHorzTextAlign("center");
    obj.edit161:setType("number");
    obj.edit161:setMin(0);
    obj.edit161:setName("edit161");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.layout65);
    obj.layout71:setAlign("left");
    obj.layout71:setMargins({left=20});
    obj.layout71:setWidth(120);
    obj.layout71:setHeight(70);
    obj.layout71:setName("layout71");

    obj.rectangle72 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle72:setParent(obj.layout71);
    obj.rectangle72:setTop(5);
    obj.rectangle72:setLeft(10);
    obj.rectangle72:setColor("DarkSlateBlue");
    obj.rectangle72:setWidth(90);
    obj.rectangle72:setHeight(25);
    obj.rectangle72:setName("rectangle72");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.rectangle72);
    obj.label109:setAlign("client");
    obj.label109:setText("Feitiço");
    obj.label109:setHorzTextAlign("center");
    obj.label109:setName("label109");

    obj.edit162 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout71);
    obj.edit162:setTop(30);
    obj.edit162:setWidth(120);
    obj.edit162:setField("C_FEI_Total");
    obj.edit162:setReadOnly(true);
    obj.edit162:setHorzTextAlign("center");
    obj.edit162:setType("number");
    obj.edit162:setMin(0);
    obj.edit162:setName("edit162");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.layout65);
    obj.layout72:setAlign("left");
    obj.layout72:setMargins({left=20});
    obj.layout72:setWidth(120);
    obj.layout72:setHeight(70);
    obj.layout72:setName("layout72");

    obj.rectangle73 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle73:setParent(obj.layout72);
    obj.rectangle73:setTop(5);
    obj.rectangle73:setLeft(10);
    obj.rectangle73:setColor("DarkSlateBlue");
    obj.rectangle73:setWidth(90);
    obj.rectangle73:setHeight(25);
    obj.rectangle73:setName("rectangle73");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.rectangle73);
    obj.label110:setAlign("client");
    obj.label110:setText("Transmutação");
    obj.label110:setHorzTextAlign("center");
    obj.label110:setName("label110");

    obj.edit163 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout72);
    obj.edit163:setTop(30);
    obj.edit163:setWidth(120);
    obj.edit163:setField("C_TRA_Total");
    obj.edit163:setReadOnly(true);
    obj.edit163:setHorzTextAlign("center");
    obj.edit163:setType("number");
    obj.edit163:setMin(0);
    obj.edit163:setName("edit163");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.layout65);
    obj.layout73:setAlign("left");
    obj.layout73:setMargins({left=20});
    obj.layout73:setWidth(120);
    obj.layout73:setHeight(70);
    obj.layout73:setName("layout73");

    obj.rectangle74 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle74:setParent(obj.layout73);
    obj.rectangle74:setTop(5);
    obj.rectangle74:setLeft(10);
    obj.rectangle74:setColor("DarkSlateBlue");
    obj.rectangle74:setWidth(90);
    obj.rectangle74:setHeight(25);
    obj.rectangle74:setName("rectangle74");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.rectangle74);
    obj.label111:setAlign("client");
    obj.label111:setText("Arte das Trevas");
    obj.label111:setHorzTextAlign("center");
    obj.label111:setName("label111");

    obj.edit164 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout73);
    obj.edit164:setTop(30);
    obj.edit164:setWidth(120);
    obj.edit164:setField("C_MAL_Total");
    obj.edit164:setReadOnly(true);
    obj.edit164:setHorzTextAlign("center");
    obj.edit164:setType("number");
    obj.edit164:setMin(0);
    obj.edit164:setName("edit164");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.scrollBox3);
    obj.layout74:setAlign("top");
    obj.layout74:setHeight(80);
    obj.layout74:setMargins({top=0, left=0});
    obj.layout74:setName("layout74");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.layout74);
    obj.layout75:setAlign("left");
    obj.layout75:setMargins({left=20});
    obj.layout75:setWidth(120);
    obj.layout75:setHeight(80);
    obj.layout75:setName("layout75");

    obj.rectangle75 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle75:setParent(obj.layout75);
    obj.rectangle75:setTop(5);
    obj.rectangle75:setLeft(10);
    obj.rectangle75:setColor("#6B8E23");
    obj.rectangle75:setWidth(90);
    obj.rectangle75:setHeight(25);
    obj.rectangle75:setName("rectangle75");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.rectangle75);
    obj.label112:setAlign("client");
    obj.label112:setText("Fisico");
    obj.label112:setHorzTextAlign("center");
    obj.label112:setName("label112");

    obj.edit165 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.layout75);
    obj.edit165:setTop(30);
    obj.edit165:setWidth(120);
    obj.edit165:setField("fisico");
    obj.edit165:setHorzTextAlign("center");
    obj.edit165:setType("float");
    obj.edit165:setName("edit165");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout75);
    obj.dataLink2:setField("fisico");
    obj.dataLink2:setName("dataLink2");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.layout74);
    obj.layout76:setAlign("left");
    obj.layout76:setMargins({left=20});
    obj.layout76:setWidth(120);
    obj.layout76:setHeight(80);
    obj.layout76:setName("layout76");

    obj.rectangle76 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle76:setParent(obj.layout76);
    obj.rectangle76:setTop(5);
    obj.rectangle76:setLeft(10);
    obj.rectangle76:setColor("#6B8E23");
    obj.rectangle76:setWidth(90);
    obj.rectangle76:setHeight(25);
    obj.rectangle76:setName("rectangle76");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.rectangle76);
    obj.label113:setAlign("client");
    obj.label113:setText("Mental");
    obj.label113:setHorzTextAlign("center");
    obj.label113:setName("label113");

    obj.edit166 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.layout76);
    obj.edit166:setTop(30);
    obj.edit166:setWidth(120);
    obj.edit166:setField("mental");
    obj.edit166:setHorzTextAlign("center");
    obj.edit166:setType("float");
    obj.edit166:setName("edit166");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout76);
    obj.dataLink3:setField("mental");
    obj.dataLink3:setName("dataLink3");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.layout74);
    obj.layout77:setAlign("left");
    obj.layout77:setMargins({left=20});
    obj.layout77:setWidth(120);
    obj.layout77:setHeight(70);
    obj.layout77:setName("layout77");

    obj.rectangle77 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle77:setParent(obj.layout77);
    obj.rectangle77:setTop(5);
    obj.rectangle77:setLeft(10);
    obj.rectangle77:setColor("purple");
    obj.rectangle77:setWidth(90);
    obj.rectangle77:setHeight(25);
    obj.rectangle77:setName("rectangle77");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.rectangle77);
    obj.label114:setAlign("client");
    obj.label114:setText("Concentração");
    obj.label114:setHorzTextAlign("center");
    obj.label114:setName("label114");

    obj.edit167 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.layout77);
    obj.edit167:setTop(30);
    obj.edit167:setWidth(120);
    obj.edit167:setField("concentracao");
    obj.edit167:setReadOnly(false);
    obj.edit167:setHorzTextAlign("center");
    obj.edit167:setType("number");
    obj.edit167:setMin(0);
    obj.edit167:setName("edit167");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.layout74);
    obj.layout78:setAlign("left");
    obj.layout78:setMargins({left=20});
    obj.layout78:setWidth(120);
    obj.layout78:setHeight(70);
    obj.layout78:setName("layout78");

    obj.rectangle78 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle78:setParent(obj.layout78);
    obj.rectangle78:setTop(5);
    obj.rectangle78:setLeft(10);
    obj.rectangle78:setColor("purple");
    obj.rectangle78:setWidth(90);
    obj.rectangle78:setHeight(25);
    obj.rectangle78:setName("rectangle78");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.rectangle78);
    obj.label115:setAlign("client");
    obj.label115:setText("Acerto");
    obj.label115:setHorzTextAlign("center");
    obj.label115:setName("label115");

    obj.edit168 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.layout78);
    obj.edit168:setTop(30);
    obj.edit168:setWidth(120);
    obj.edit168:setField("acerto");
    obj.edit168:setReadOnly(false);
    obj.edit168:setHorzTextAlign("center");
    obj.edit168:setType("number");
    obj.edit168:setMin(0);
    obj.edit168:setName("edit168");

    obj.aqui = GUI.fromHandle(_obj_newObject("layout"));
    obj.aqui:setParent(obj.scrollBox3);
    obj.aqui:setName("aqui");
    obj.aqui:setAlign("top");
    obj.aqui:setHeight(600);
    obj.aqui:setPadding({top=5, left=5});

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.aqui);
    obj.layout79:setLeft(20);
    obj.layout79:setTop(15);
    obj.layout79:setWidth(600);
    obj.layout79:setHeight(35);
    obj.layout79:setName("layout79");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout79);
    obj.button4:setAlign("left");
    obj.button4:setMargins({left=20});
    obj.button4:setHeight(25);
    obj.button4:setText("Novo Feitiço");
    obj.button4:setWidth(100);
    obj.button4:setName("button4");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout79);
    obj.button5:setAlign("left");
    obj.button5:setHeight(25);
    obj.button5:setText("Ordenar");
    obj.button5:setWidth(100);
    obj.button5:setMargins({left=20});
    obj.button5:setName("button5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout79);
    obj.button6:setAlign("left");
    obj.button6:setText("Atualizar Feitiços");
    obj.button6:setWidth(120);
    obj.button6:setMargins({left=20});
    obj.button6:setName("button6");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.aqui);
    obj.layout80:setLeft(20);
    obj.layout80:setTop(60);
    obj.layout80:setHeight(310);
    obj.layout80:setWidth(1200);
    obj.layout80:setName("layout80");

    obj.rectangle79 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle79:setParent(obj.layout80);
    obj.rectangle79:setColor("#444444");
    obj.rectangle79:setWidth(200);
    obj.rectangle79:setAlign("left");
    obj.rectangle79:setStrokeColor("#333333");
    obj.rectangle79:setStrokeSize(2);
    obj.rectangle79:setName("rectangle79");

    obj.rclMagias = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMagias:setParent(obj.rectangle79);
    obj.rclMagias:setName("rclMagias");
    obj.rclMagias:setField("magias");
    obj.rclMagias:setItemHeight(45);
    obj.rclMagias:setTemplateForm("feiticos");
    obj.rclMagias:setAlign("left");
    obj.rclMagias:setWidth(200);
    obj.rclMagias:setVisible(true);
    obj.rclMagias:setAutoHeight(false);
    obj.rclMagias:setSelectable(true);

    obj.boxDetalhesDoItem = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoItem:setParent(obj.layout80);
    obj.boxDetalhesDoItem:setName("boxDetalhesDoItem");
    obj.boxDetalhesDoItem:setVisible(false);
    obj.boxDetalhesDoItem:setAlign("left");
    obj.boxDetalhesDoItem:setWidth(1000);
    obj.boxDetalhesDoItem:setMargins({left=4, right=4});

    obj.rectangle = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle:setParent(obj.boxDetalhesDoItem);
    obj.rectangle:setName("rectangle");
    obj.rectangle:setColor("darkGrey");
    obj.rectangle:setOpacity(0.35);
    obj.rectangle:setWidth(1020);
    obj.rectangle:setHeight(170);

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.boxDetalhesDoItem);
    obj.layout81:setAlign("top");
    obj.layout81:setHeight(170);
    obj.layout81:setName("layout81");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.layout81);
    obj.layout82:setAlign("left");
    obj.layout82:setMargins({left=10});
    obj.layout82:setWidth(180);
    obj.layout82:setName("layout82");

    obj.rectangle80 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle80:setParent(obj.layout82);
    obj.rectangle80:setAlign("top");
    obj.rectangle80:setColor("DarkSlateBlue");
    obj.rectangle80:setMargins({left=60,right=60,top=5});
    obj.rectangle80:setHeight(20);
    obj.rectangle80:setName("rectangle80");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.rectangle80);
    obj.label116:setAlign("client");
    obj.label116:setText("Nome");
    obj.label116:setHorzTextAlign("center");
    obj.label116:setName("label116");

    obj.nome = GUI.fromHandle(_obj_newObject("edit"));
    obj.nome:setParent(obj.layout82);
    obj.nome:setName("nome");
    lfm_setPropAsString(obj.nome, "fontStyle", "bold italic");
    obj.nome:setFontSize(15);
    obj.nome:setHorzTextAlign("center");
    obj.nome:setHeight(27);
    obj.nome:setAlign("top");
    obj.nome:setField("nome");
    obj.nome:setHitTest(true);

    obj.rectangle81 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle81:setParent(obj.layout82);
    obj.rectangle81:setAlign("top");
    obj.rectangle81:setColor("DarkSlateBlue");
    obj.rectangle81:setMargins({left=60,right=60,top=5});
    obj.rectangle81:setHeight(20);
    obj.rectangle81:setName("rectangle81");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.rectangle81);
    obj.label117:setAlign("client");
    obj.label117:setText("Escola");
    obj.label117:setHorzTextAlign("center");
    obj.label117:setName("label117");

    obj.escola = GUI.fromHandle(_obj_newObject("edit"));
    obj.escola:setParent(obj.layout82);
    obj.escola:setName("escola");
    obj.escola:setHorzTextAlign("center");
    obj.escola:setHeight(27);
    lfm_setPropAsString(obj.escola, "fontStyle", "bold italic");
    obj.escola:setAlign("top");
    obj.escola:setReadOnly(true);
    obj.escola:setField("escola");

    obj.rectangle82 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle82:setParent(obj.layout82);
    obj.rectangle82:setAlign("top");
    obj.rectangle82:setColor("DarkSlateBlue");
    obj.rectangle82:setMargins({left=60,right=60,top=5});
    obj.rectangle82:setHeight(20);
    obj.rectangle82:setName("rectangle82");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.rectangle82);
    obj.label118:setAlign("client");
    obj.label118:setText("Ação");
    obj.label118:setHorzTextAlign("center");
    obj.label118:setName("label118");

    obj.tipo = GUI.fromHandle(_obj_newObject("edit"));
    obj.tipo:setParent(obj.layout82);
    obj.tipo:setName("tipo");
    obj.tipo:setHorzTextAlign("center");
    obj.tipo:setHeight(27);
    lfm_setPropAsString(obj.tipo, "fontStyle", "bold italic");
    obj.tipo:setAlign("top");
    obj.tipo:setReadOnly(true);
    obj.tipo:setField("tipo");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.layout81);
    obj.layout83:setAlign("left");
    obj.layout83:setWidth(530);
    obj.layout83:setName("layout83");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.layout83);
    obj.layout84:setAlign("top");
    obj.layout84:setHeight(55);
    obj.layout84:setName("layout84");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.layout84);
    obj.layout85:setAlign("left");
    obj.layout85:setMargins({left=10});
    obj.layout85:setWidth(160);
    obj.layout85:setName("layout85");

    obj.rectangle83 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle83:setParent(obj.layout85);
    obj.rectangle83:setTop(7);
    obj.rectangle83:setLeft(27);
    obj.rectangle83:setColor("DarkSlateBlue");
    obj.rectangle83:setWidth(105);
    obj.rectangle83:setHeight(20);
    obj.rectangle83:setName("rectangle83");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.rectangle83);
    obj.label119:setAlign("client");
    obj.label119:setText("Grad");
    obj.label119:setHorzTextAlign("center");
    obj.label119:setName("label119");

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.layout85);
    obj.layout86:setTop(27);
    obj.layout86:setWidth(160);
    obj.layout86:setHeight(25);
    obj.layout86:setName("layout86");

    obj.edit169 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit169:setParent(obj.layout86);
    obj.edit169:setTop(0);
    obj.edit169:setWidth(160);
    obj.edit169:setHeight(25);
    obj.edit169:setField("Grad .. _name");
    obj.edit169:setHorzTextAlign("center");
    obj.edit169:setName("edit169");

    obj.edit170 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit170:setParent(obj.layout86);
    obj.edit170:setTop(0);
    obj.edit170:setWidth(160);
    obj.edit170:setHeight(25);
    obj.edit170:setField("Grad .. _array");
    obj.edit170:setHorzTextAlign("center");
    obj.edit170:setName("edit170");

    obj.edit171 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit171:setParent(obj.layout86);
    obj.edit171:setTop(0);
    obj.edit171:setWidth(160);
    obj.edit171:setHeight(25);
    obj.edit171:setField("Grad .. _grad");
    obj.edit171:setHorzTextAlign("center");
    obj.edit171:setName("edit171");

    obj.Grad = GUI.fromHandle(_obj_newObject("edit"));
    obj.Grad:setParent(obj.layout86);
    obj.Grad:setName("Grad");
    obj.Grad:setTop(0);
    obj.Grad:setWidth(160);
    obj.Grad:setHeight(25);
    obj.Grad:setField("Grad");
    obj.Grad:setHorzTextAlign("center");
    obj.Grad:setHitTest(true);
    obj.Grad:setHint("");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout86);
    obj.button7:setText("-");
    obj.button7:setAlign("left");
    obj.button7:setWidth(20);
    obj.button7:setName("button7");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout86);
    obj.button8:setText("+");
    obj.button8:setAlign("right");
    obj.button8:setWidth(20);
    obj.button8:setName("button8");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.layout84);
    obj.layout87:setAlign("left");
    obj.layout87:setMargins({left=10});
    obj.layout87:setWidth(160);
    obj.layout87:setName("layout87");

    obj.rectangle84 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle84:setParent(obj.layout87);
    obj.rectangle84:setTop(7);
    obj.rectangle84:setLeft(27);
    obj.rectangle84:setColor("DarkSlateBlue");
    obj.rectangle84:setWidth(105);
    obj.rectangle84:setHeight(20);
    obj.rectangle84:setName("rectangle84");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.rectangle84);
    obj.label120:setAlign("client");
    obj.label120:setText("CD");
    obj.label120:setHorzTextAlign("center");
    obj.label120:setName("label120");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.layout87);
    obj.layout88:setTop(27);
    obj.layout88:setWidth(160);
    obj.layout88:setHeight(25);
    obj.layout88:setName("layout88");

    obj.edit172 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit172:setParent(obj.layout88);
    obj.edit172:setTop(0);
    obj.edit172:setWidth(160);
    obj.edit172:setHeight(25);
    obj.edit172:setField("CD .. _name");
    obj.edit172:setHorzTextAlign("center");
    obj.edit172:setName("edit172");

    obj.edit173 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit173:setParent(obj.layout88);
    obj.edit173:setTop(0);
    obj.edit173:setWidth(160);
    obj.edit173:setHeight(25);
    obj.edit173:setField("CD .. _array");
    obj.edit173:setHorzTextAlign("center");
    obj.edit173:setName("edit173");

    obj.edit174 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit174:setParent(obj.layout88);
    obj.edit174:setTop(0);
    obj.edit174:setWidth(160);
    obj.edit174:setHeight(25);
    obj.edit174:setField("CD .. _grad");
    obj.edit174:setHorzTextAlign("center");
    obj.edit174:setName("edit174");

    obj.CD = GUI.fromHandle(_obj_newObject("edit"));
    obj.CD:setParent(obj.layout88);
    obj.CD:setName("CD");
    obj.CD:setTop(0);
    obj.CD:setWidth(160);
    obj.CD:setHeight(25);
    obj.CD:setField("CD");
    obj.CD:setHorzTextAlign("center");
    obj.CD:setHitTest(true);
    obj.CD:setHint("");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout88);
    obj.button9:setText("-");
    obj.button9:setAlign("left");
    obj.button9:setWidth(20);
    obj.button9:setName("button9");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout88);
    obj.button10:setText("+");
    obj.button10:setAlign("right");
    obj.button10:setWidth(20);
    obj.button10:setName("button10");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.layout84);
    obj.layout89:setAlign("left");
    obj.layout89:setMargins({left=10});
    obj.layout89:setWidth(160);
    obj.layout89:setName("layout89");

    obj.rectangle85 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle85:setParent(obj.layout89);
    obj.rectangle85:setTop(7);
    obj.rectangle85:setLeft(27);
    obj.rectangle85:setColor("DarkSlateBlue");
    obj.rectangle85:setWidth(105);
    obj.rectangle85:setHeight(20);
    obj.rectangle85:setName("rectangle85");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.rectangle85);
    obj.label121:setAlign("client");
    obj.label121:setText("Efeito");
    obj.label121:setHorzTextAlign("center");
    obj.label121:setName("label121");

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.layout89);
    obj.layout90:setTop(27);
    obj.layout90:setWidth(160);
    obj.layout90:setHeight(25);
    obj.layout90:setName("layout90");

    obj.edit175 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit175:setParent(obj.layout90);
    obj.edit175:setTop(0);
    obj.edit175:setWidth(160);
    obj.edit175:setHeight(25);
    obj.edit175:setField("Efeito .. _name");
    obj.edit175:setHorzTextAlign("center");
    obj.edit175:setName("edit175");

    obj.edit176 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit176:setParent(obj.layout90);
    obj.edit176:setTop(0);
    obj.edit176:setWidth(160);
    obj.edit176:setHeight(25);
    obj.edit176:setField("Efeito .. _array");
    obj.edit176:setHorzTextAlign("center");
    obj.edit176:setName("edit176");

    obj.edit177 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit177:setParent(obj.layout90);
    obj.edit177:setTop(0);
    obj.edit177:setWidth(160);
    obj.edit177:setHeight(25);
    obj.edit177:setField("Efeito .. _grad");
    obj.edit177:setHorzTextAlign("center");
    obj.edit177:setName("edit177");

    obj.Efeito = GUI.fromHandle(_obj_newObject("edit"));
    obj.Efeito:setParent(obj.layout90);
    obj.Efeito:setName("Efeito");
    obj.Efeito:setTop(0);
    obj.Efeito:setWidth(160);
    obj.Efeito:setHeight(25);
    obj.Efeito:setField("Efeito");
    obj.Efeito:setHorzTextAlign("center");
    obj.Efeito:setHitTest(true);
    obj.Efeito:setHint("");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout90);
    obj.button11:setText("-");
    obj.button11:setAlign("left");
    obj.button11:setWidth(20);
    obj.button11:setName("button11");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout90);
    obj.button12:setText("+");
    obj.button12:setAlign("right");
    obj.button12:setWidth(20);
    obj.button12:setName("button12");

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.layout83);
    obj.layout91:setAlign("top");
    obj.layout91:setHeight(55);
    obj.layout91:setName("layout91");

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.layout91);
    obj.layout92:setAlign("left");
    obj.layout92:setMargins({left=10});
    obj.layout92:setWidth(160);
    obj.layout92:setName("layout92");

    obj.rectangle86 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle86:setParent(obj.layout92);
    obj.rectangle86:setTop(7);
    obj.rectangle86:setLeft(27);
    obj.rectangle86:setColor("DarkSlateBlue");
    obj.rectangle86:setWidth(105);
    obj.rectangle86:setHeight(20);
    obj.rectangle86:setName("rectangle86");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.rectangle86);
    obj.label122:setAlign("client");
    obj.label122:setText("Poder");
    obj.label122:setHorzTextAlign("center");
    obj.label122:setName("label122");

    obj.layout93 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.layout92);
    obj.layout93:setTop(27);
    obj.layout93:setWidth(160);
    obj.layout93:setHeight(25);
    obj.layout93:setName("layout93");

    obj.edit178 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit178:setParent(obj.layout93);
    obj.edit178:setTop(0);
    obj.edit178:setWidth(160);
    obj.edit178:setHeight(25);
    obj.edit178:setField("Poder .. _name");
    obj.edit178:setHorzTextAlign("center");
    obj.edit178:setName("edit178");

    obj.edit179 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit179:setParent(obj.layout93);
    obj.edit179:setTop(0);
    obj.edit179:setWidth(160);
    obj.edit179:setHeight(25);
    obj.edit179:setField("Poder .. _array");
    obj.edit179:setHorzTextAlign("center");
    obj.edit179:setName("edit179");

    obj.edit180 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit180:setParent(obj.layout93);
    obj.edit180:setTop(0);
    obj.edit180:setWidth(160);
    obj.edit180:setHeight(25);
    obj.edit180:setField("Poder .. _grad");
    obj.edit180:setHorzTextAlign("center");
    obj.edit180:setName("edit180");

    obj.Poder = GUI.fromHandle(_obj_newObject("edit"));
    obj.Poder:setParent(obj.layout93);
    obj.Poder:setName("Poder");
    obj.Poder:setTop(0);
    obj.Poder:setWidth(160);
    obj.Poder:setHeight(25);
    obj.Poder:setField("Poder");
    obj.Poder:setHorzTextAlign("center");
    obj.Poder:setHitTest(true);
    obj.Poder:setHint("");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout93);
    obj.button13:setText("-");
    obj.button13:setAlign("left");
    obj.button13:setWidth(20);
    obj.button13:setName("button13");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout93);
    obj.button14:setText("+");
    obj.button14:setAlign("right");
    obj.button14:setWidth(20);
    obj.button14:setName("button14");

    obj.layout94 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.layout91);
    obj.layout94:setAlign("left");
    obj.layout94:setMargins({left=10});
    obj.layout94:setWidth(160);
    obj.layout94:setName("layout94");

    obj.rectangle87 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle87:setParent(obj.layout94);
    obj.rectangle87:setTop(7);
    obj.rectangle87:setLeft(27);
    obj.rectangle87:setColor("DarkSlateBlue");
    obj.rectangle87:setWidth(105);
    obj.rectangle87:setHeight(20);
    obj.rectangle87:setName("rectangle87");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.rectangle87);
    obj.label123:setAlign("client");
    obj.label123:setText("Dano");
    obj.label123:setHorzTextAlign("center");
    obj.label123:setName("label123");

    obj.layout95 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.layout94);
    obj.layout95:setTop(27);
    obj.layout95:setWidth(160);
    obj.layout95:setHeight(25);
    obj.layout95:setName("layout95");

    obj.edit181 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit181:setParent(obj.layout95);
    obj.edit181:setTop(0);
    obj.edit181:setWidth(160);
    obj.edit181:setHeight(25);
    obj.edit181:setField("Dano .. _name");
    obj.edit181:setHorzTextAlign("center");
    obj.edit181:setName("edit181");

    obj.edit182 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit182:setParent(obj.layout95);
    obj.edit182:setTop(0);
    obj.edit182:setWidth(160);
    obj.edit182:setHeight(25);
    obj.edit182:setField("Dano .. _array");
    obj.edit182:setHorzTextAlign("center");
    obj.edit182:setName("edit182");

    obj.edit183 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit183:setParent(obj.layout95);
    obj.edit183:setTop(0);
    obj.edit183:setWidth(160);
    obj.edit183:setHeight(25);
    obj.edit183:setField("Dano .. _grad");
    obj.edit183:setHorzTextAlign("center");
    obj.edit183:setName("edit183");

    obj.Dano = GUI.fromHandle(_obj_newObject("edit"));
    obj.Dano:setParent(obj.layout95);
    obj.Dano:setName("Dano");
    obj.Dano:setTop(0);
    obj.Dano:setWidth(160);
    obj.Dano:setHeight(25);
    obj.Dano:setField("Dano");
    obj.Dano:setHorzTextAlign("center");
    obj.Dano:setHitTest(true);
    obj.Dano:setHint("");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout95);
    obj.button15:setText("-");
    obj.button15:setAlign("left");
    obj.button15:setWidth(20);
    obj.button15:setName("button15");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout95);
    obj.button16:setText("+");
    obj.button16:setAlign("right");
    obj.button16:setWidth(20);
    obj.button16:setName("button16");

    obj.layout96 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.layout91);
    obj.layout96:setAlign("left");
    obj.layout96:setMargins({left=10});
    obj.layout96:setWidth(160);
    obj.layout96:setName("layout96");

    obj.rectangle88 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle88:setParent(obj.layout96);
    obj.rectangle88:setTop(7);
    obj.rectangle88:setLeft(27);
    obj.rectangle88:setColor("DarkSlateBlue");
    obj.rectangle88:setWidth(105);
    obj.rectangle88:setHeight(20);
    obj.rectangle88:setName("rectangle88");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.rectangle88);
    obj.label124:setAlign("client");
    obj.label124:setText("Bonus");
    obj.label124:setHorzTextAlign("center");
    obj.label124:setName("label124");

    obj.layout97 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.layout96);
    obj.layout97:setTop(27);
    obj.layout97:setWidth(160);
    obj.layout97:setHeight(25);
    obj.layout97:setName("layout97");

    obj.edit184 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit184:setParent(obj.layout97);
    obj.edit184:setTop(0);
    obj.edit184:setWidth(160);
    obj.edit184:setHeight(25);
    obj.edit184:setField("Bonus .. _name");
    obj.edit184:setHorzTextAlign("center");
    obj.edit184:setName("edit184");

    obj.edit185 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit185:setParent(obj.layout97);
    obj.edit185:setTop(0);
    obj.edit185:setWidth(160);
    obj.edit185:setHeight(25);
    obj.edit185:setField("Bonus .. _array");
    obj.edit185:setHorzTextAlign("center");
    obj.edit185:setName("edit185");

    obj.edit186 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit186:setParent(obj.layout97);
    obj.edit186:setTop(0);
    obj.edit186:setWidth(160);
    obj.edit186:setHeight(25);
    obj.edit186:setField("Bonus .. _grad");
    obj.edit186:setHorzTextAlign("center");
    obj.edit186:setName("edit186");

    obj.Bonus = GUI.fromHandle(_obj_newObject("edit"));
    obj.Bonus:setParent(obj.layout97);
    obj.Bonus:setName("Bonus");
    obj.Bonus:setTop(0);
    obj.Bonus:setWidth(160);
    obj.Bonus:setHeight(25);
    obj.Bonus:setField("Bonus");
    obj.Bonus:setHorzTextAlign("center");
    obj.Bonus:setHitTest(true);
    obj.Bonus:setHint("");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout97);
    obj.button17:setText("-");
    obj.button17:setAlign("left");
    obj.button17:setWidth(20);
    obj.button17:setName("button17");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout97);
    obj.button18:setText("+");
    obj.button18:setAlign("right");
    obj.button18:setWidth(20);
    obj.button18:setName("button18");

    obj.layout98 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.layout83);
    obj.layout98:setAlign("top");
    obj.layout98:setHeight(55);
    obj.layout98:setName("layout98");

    obj.layout99 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.layout98);
    obj.layout99:setAlign("left");
    obj.layout99:setMargins({left=10});
    obj.layout99:setWidth(160);
    obj.layout99:setName("layout99");

    obj.rectangle89 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle89:setParent(obj.layout99);
    obj.rectangle89:setTop(7);
    obj.rectangle89:setLeft(27);
    obj.rectangle89:setColor("DarkSlateBlue");
    obj.rectangle89:setWidth(105);
    obj.rectangle89:setHeight(20);
    obj.rectangle89:setName("rectangle89");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.rectangle89);
    obj.label125:setAlign("client");
    obj.label125:setText("Range");
    obj.label125:setHorzTextAlign("center");
    obj.label125:setName("label125");

    obj.layout100 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.layout99);
    obj.layout100:setTop(27);
    obj.layout100:setWidth(160);
    obj.layout100:setHeight(25);
    obj.layout100:setName("layout100");

    obj.edit187 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit187:setParent(obj.layout100);
    obj.edit187:setTop(0);
    obj.edit187:setWidth(160);
    obj.edit187:setHeight(25);
    obj.edit187:setField("Range .. _name");
    obj.edit187:setHorzTextAlign("center");
    obj.edit187:setName("edit187");

    obj.edit188 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit188:setParent(obj.layout100);
    obj.edit188:setTop(0);
    obj.edit188:setWidth(160);
    obj.edit188:setHeight(25);
    obj.edit188:setField("Range .. _array");
    obj.edit188:setHorzTextAlign("center");
    obj.edit188:setName("edit188");

    obj.edit189 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit189:setParent(obj.layout100);
    obj.edit189:setTop(0);
    obj.edit189:setWidth(160);
    obj.edit189:setHeight(25);
    obj.edit189:setField("Range .. _grad");
    obj.edit189:setHorzTextAlign("center");
    obj.edit189:setName("edit189");

    obj.Range = GUI.fromHandle(_obj_newObject("edit"));
    obj.Range:setParent(obj.layout100);
    obj.Range:setName("Range");
    obj.Range:setTop(0);
    obj.Range:setWidth(160);
    obj.Range:setHeight(25);
    obj.Range:setField("Range");
    obj.Range:setHorzTextAlign("center");
    obj.Range:setHitTest(true);
    obj.Range:setHint("");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout100);
    obj.button19:setText("-");
    obj.button19:setAlign("left");
    obj.button19:setWidth(20);
    obj.button19:setName("button19");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout100);
    obj.button20:setText("+");
    obj.button20:setAlign("right");
    obj.button20:setWidth(20);
    obj.button20:setName("button20");

    obj.layout101 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.layout98);
    obj.layout101:setAlign("left");
    obj.layout101:setMargins({left=10});
    obj.layout101:setWidth(160);
    obj.layout101:setName("layout101");

    obj.rectangle90 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle90:setParent(obj.layout101);
    obj.rectangle90:setTop(7);
    obj.rectangle90:setLeft(27);
    obj.rectangle90:setColor("DarkSlateBlue");
    obj.rectangle90:setWidth(105);
    obj.rectangle90:setHeight(20);
    obj.rectangle90:setName("rectangle90");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.rectangle90);
    obj.label126:setAlign("client");
    obj.label126:setText("Area");
    obj.label126:setHorzTextAlign("center");
    obj.label126:setName("label126");

    obj.layout102 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.layout101);
    obj.layout102:setTop(27);
    obj.layout102:setWidth(160);
    obj.layout102:setHeight(25);
    obj.layout102:setName("layout102");

    obj.edit190 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit190:setParent(obj.layout102);
    obj.edit190:setTop(0);
    obj.edit190:setWidth(160);
    obj.edit190:setHeight(25);
    obj.edit190:setField("Area .. _name");
    obj.edit190:setHorzTextAlign("center");
    obj.edit190:setName("edit190");

    obj.edit191 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit191:setParent(obj.layout102);
    obj.edit191:setTop(0);
    obj.edit191:setWidth(160);
    obj.edit191:setHeight(25);
    obj.edit191:setField("Area .. _array");
    obj.edit191:setHorzTextAlign("center");
    obj.edit191:setName("edit191");

    obj.edit192 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit192:setParent(obj.layout102);
    obj.edit192:setTop(0);
    obj.edit192:setWidth(160);
    obj.edit192:setHeight(25);
    obj.edit192:setField("Area .. _grad");
    obj.edit192:setHorzTextAlign("center");
    obj.edit192:setName("edit192");

    obj.Area = GUI.fromHandle(_obj_newObject("edit"));
    obj.Area:setParent(obj.layout102);
    obj.Area:setName("Area");
    obj.Area:setTop(0);
    obj.Area:setWidth(160);
    obj.Area:setHeight(25);
    obj.Area:setField("Area");
    obj.Area:setHorzTextAlign("center");
    obj.Area:setHitTest(true);
    obj.Area:setHint("");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.layout102);
    obj.button21:setText("-");
    obj.button21:setAlign("left");
    obj.button21:setWidth(20);
    obj.button21:setName("button21");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.layout102);
    obj.button22:setText("+");
    obj.button22:setAlign("right");
    obj.button22:setWidth(20);
    obj.button22:setName("button22");

    obj.layout103 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.layout98);
    obj.layout103:setAlign("left");
    obj.layout103:setMargins({left=10});
    obj.layout103:setWidth(160);
    obj.layout103:setName("layout103");

    obj.rectangle91 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle91:setParent(obj.layout103);
    obj.rectangle91:setTop(7);
    obj.rectangle91:setLeft(27);
    obj.rectangle91:setColor("DarkSlateBlue");
    obj.rectangle91:setWidth(105);
    obj.rectangle91:setHeight(20);
    obj.rectangle91:setName("rectangle91");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.rectangle91);
    obj.label127:setAlign("client");
    obj.label127:setText("Duração");
    obj.label127:setHorzTextAlign("center");
    obj.label127:setName("label127");

    obj.layout104 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.layout103);
    obj.layout104:setTop(27);
    obj.layout104:setWidth(160);
    obj.layout104:setHeight(25);
    obj.layout104:setName("layout104");

    obj.edit193 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit193:setParent(obj.layout104);
    obj.edit193:setTop(0);
    obj.edit193:setWidth(160);
    obj.edit193:setHeight(25);
    obj.edit193:setField("Duracao .. _name");
    obj.edit193:setHorzTextAlign("center");
    obj.edit193:setName("edit193");

    obj.edit194 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit194:setParent(obj.layout104);
    obj.edit194:setTop(0);
    obj.edit194:setWidth(160);
    obj.edit194:setHeight(25);
    obj.edit194:setField("Duracao .. _array");
    obj.edit194:setHorzTextAlign("center");
    obj.edit194:setName("edit194");

    obj.edit195 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit195:setParent(obj.layout104);
    obj.edit195:setTop(0);
    obj.edit195:setWidth(160);
    obj.edit195:setHeight(25);
    obj.edit195:setField("Duracao .. _grad");
    obj.edit195:setHorzTextAlign("center");
    obj.edit195:setName("edit195");

    obj.Duracao = GUI.fromHandle(_obj_newObject("edit"));
    obj.Duracao:setParent(obj.layout104);
    obj.Duracao:setName("Duracao");
    obj.Duracao:setTop(0);
    obj.Duracao:setWidth(160);
    obj.Duracao:setHeight(25);
    obj.Duracao:setField("Duracao");
    obj.Duracao:setHorzTextAlign("center");
    obj.Duracao:setHitTest(true);
    obj.Duracao:setHint("");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.layout104);
    obj.button23:setText("-");
    obj.button23:setAlign("left");
    obj.button23:setWidth(20);
    obj.button23:setName("button23");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.layout104);
    obj.button24:setText("+");
    obj.button24:setAlign("right");
    obj.button24:setWidth(20);
    obj.button24:setName("button24");

    obj.layout105 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.layout81);
    obj.layout105:setWidth(50);
    obj.layout105:setAlign("left");
    obj.layout105:setName("layout105");

    obj.rectangle92 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle92:setParent(obj.layout105);
    obj.rectangle92:setTop(55);
    obj.rectangle92:setLeft(5);
    obj.rectangle92:setColor("purple");
    obj.rectangle92:setWidth(40);
    obj.rectangle92:setHeight(20);
    obj.rectangle92:setName("rectangle92");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.rectangle92);
    obj.label128:setAlign("client");
    obj.label128:setText("Order");
    obj.label128:setHorzTextAlign("center");
    obj.label128:setName("label128");

    obj.edit196 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit196:setParent(obj.layout105);
    obj.edit196:setTop(75);
    obj.edit196:setLeft(5);
    obj.edit196:setWidth(40);
    obj.edit196:setHeight(25);
    obj.edit196:setField("Order");
    obj.edit196:setHorzTextAlign("center");
    obj.edit196:setHint("Quanto menor mais acima na lista!");
    obj.edit196:setName("edit196");

    obj.layout106 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.layout81);
    obj.layout106:setWidth(100);
    obj.layout106:setAlign("left");
    obj.layout106:setName("layout106");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.layout106);
    obj.button25:setAlign("top");
    obj.button25:setText("Rolar");
    obj.button25:setHeight(35);
    obj.button25:setMargins({bottom=5});
    obj.button25:setName("button25");

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.layout106);
    obj.button26:setAlign("top");
    obj.button26:setText("Importar");
    obj.button26:setHeight(35);
    obj.button26:setMargins({bottom=5});
    obj.button26:setName("button26");

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.layout106);
    obj.button27:setAlign("top");
    obj.button27:setText("Apagar");
    obj.button27:setHeight(35);
    obj.button27:setMargins({bottom=5});
    obj.button27:setName("button27");

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.layout106);
    obj.button28:setAlign("top");
    obj.button28:setText("Comparar");
    obj.button28:setHeight(35);
    obj.button28:setName("button28");

    obj.layout107 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.boxDetalhesDoItem);
    obj.layout107:setAlign("top");
    obj.layout107:setHeight(170);
    obj.layout107:setName("layout107");

    obj.layout108 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.layout107);
    obj.layout108:setAlign("left");
    obj.layout108:setWidth(300);
    obj.layout108:setMargins({right=5});
    obj.layout108:setName("layout108");

    obj.rectangle93 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle93:setParent(obj.layout108);
    obj.rectangle93:setAlign("top");
    obj.rectangle93:setColor("DarkSlateBlue");
    obj.rectangle93:setMargins({top=5});
    obj.rectangle93:setHeight(20);
    obj.rectangle93:setName("rectangle93");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.rectangle93);
    obj.label129:setAlign("client");
    obj.label129:setText("Descrição");
    obj.label129:setHorzTextAlign("center");
    obj.label129:setName("label129");

    obj.rectangle94 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle94:setParent(obj.layout108);
    obj.rectangle94:setAlign("top");
    obj.rectangle94:setColor("#333333");
    obj.rectangle94:setMargins({top=5});
    obj.rectangle94:setHeight(150);
    obj.rectangle94:setName("rectangle94");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.rectangle94);
    obj.label130:setAlign("client");
    obj.label130:setField("Desc");
    obj.label130:setMargins({top=5,left=5,right=5});
    obj.label130:setHorzTextAlign("center");
    obj.label130:setVertTextAlign("leading");
    obj.label130:setName("label130");

    obj.layout109 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.layout107);
    obj.layout109:setAlign("left");
    obj.layout109:setWidth(300);
    obj.layout109:setMargins({right=5});
    obj.layout109:setName("layout109");

    obj.rectangle95 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle95:setParent(obj.layout109);
    obj.rectangle95:setAlign("top");
    obj.rectangle95:setColor("DarkSlateBlue");
    obj.rectangle95:setMargins({top=5});
    obj.rectangle95:setHeight(20);
    obj.rectangle95:setName("rectangle95");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.rectangle95);
    obj.label131:setAlign("client");
    obj.label131:setText("Efeito");
    obj.label131:setHorzTextAlign("center");
    obj.label131:setName("label131");

    obj.rectangle96 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle96:setParent(obj.layout109);
    obj.rectangle96:setAlign("top");
    obj.rectangle96:setColor("#333333");
    obj.rectangle96:setMargins({top=5});
    obj.rectangle96:setHeight(150);
    obj.rectangle96:setName("rectangle96");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.rectangle96);
    obj.label132:setAlign("client");
    obj.label132:setField("Efeito");
    obj.label132:setMargins({top=5,left=5,right=5});
    obj.label132:setHorzTextAlign("center");
    obj.label132:setVertTextAlign("leading");
    obj.label132:setName("label132");

    obj.layout110 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.layout107);
    obj.layout110:setAlign("left");
    obj.layout110:setWidth(300);
    obj.layout110:setMargins({right=5});
    obj.layout110:setName("layout110");

    obj.layout111 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.layout110);
    obj.layout111:setAlign("top");
    obj.layout111:setHeight(70);
    obj.layout111:setName("layout111");

    obj.rectangle97 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle97:setParent(obj.layout111);
    obj.rectangle97:setAlign("top");
    obj.rectangle97:setColor("DarkSlateBlue");
    obj.rectangle97:setMargins({top=5});
    obj.rectangle97:setHeight(20);
    obj.rectangle97:setName("rectangle97");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.rectangle97);
    obj.label133:setAlign("client");
    obj.label133:setText("Testes");
    obj.label133:setHorzTextAlign("center");
    obj.label133:setName("label133");

    obj.rectangle98 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle98:setParent(obj.layout111);
    obj.rectangle98:setAlign("top");
    obj.rectangle98:setColor("#333333");
    obj.rectangle98:setMargins({top=5});
    obj.rectangle98:setHeight(150);
    obj.rectangle98:setName("rectangle98");

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.rectangle98);
    obj.label134:setAlign("client");
    obj.label134:setField("defesa");
    obj.label134:setMargins({top=5,left=5,right=5});
    obj.label134:setHorzTextAlign("center");
    obj.label134:setVertTextAlign("leading");
    obj.label134:setName("label134");

    obj.layout112 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.layout110);
    obj.layout112:setAlign("top");
    obj.layout112:setHeight(85);
    obj.layout112:setName("layout112");

    obj.rectangle99 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle99:setParent(obj.layout112);
    obj.rectangle99:setAlign("top");
    obj.rectangle99:setColor("DarkSlateBlue");
    obj.rectangle99:setMargins({top=5});
    obj.rectangle99:setHeight(20);
    obj.rectangle99:setName("rectangle99");

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.rectangle99);
    obj.label135:setAlign("client");
    obj.label135:setText("Bonus");
    obj.label135:setHorzTextAlign("center");
    obj.label135:setName("label135");

    obj.rectangle100 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle100:setParent(obj.layout112);
    obj.rectangle100:setAlign("top");
    obj.rectangle100:setColor("#333333");
    obj.rectangle100:setMargins({top=5});
    obj.rectangle100:setHeight(150);
    obj.rectangle100:setName("rectangle100");

    obj.label136 = GUI.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.rectangle100);
    obj.label136:setAlign("client");
    obj.label136:setField("Bonus");
    obj.label136:setMargins({top=5,left=5,right=5});
    obj.label136:setHorzTextAlign("center");
    obj.label136:setVertTextAlign("leading");
    obj.label136:setName("label136");

    obj.popUp = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp:setParent(obj.scrollBox3);
    obj.popUp:setName("popUp");
    obj.popUp:setLeft(50);
    obj.popUp:setTop(50);
    obj.popUp:setWidth(600);
    obj.popUp:setHeight(420);
    obj.popUp:setBackOpacity(0.5);

    obj.layout113 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.popUp);
    obj.layout113:setAlign("left");
    obj.layout113:setWidth(200);
    obj.layout113:setName("layout113");

    obj.layout114 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.layout113);
    obj.layout114:setAlign("top");
    obj.layout114:setHeight(30);
    obj.layout114:setName("layout114");

    obj.label137 = GUI.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.layout114);
    obj.label137:setAlign("left");
    obj.label137:setWidth(100);
    obj.label137:setText("");
    obj.label137:setHorzTextAlign("center");
    obj.label137:setName("label137");

    obj.label138 = GUI.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout114);
    obj.label138:setAlign("left");
    obj.label138:setWidth(100);
    obj.label138:setText("Original");
    obj.label138:setHorzTextAlign("center");
    obj.label138:setName("label138");

    obj.layout115 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.layout113);
    obj.layout115:setAlign("top");
    obj.layout115:setHeight(400);
    obj.layout115:setName("layout115");

    obj.rectangle101 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle101:setParent(obj.layout115);
    obj.rectangle101:setAlign("left");
    obj.rectangle101:setWidth(100);
    obj.rectangle101:setColor("black");
    obj.rectangle101:setName("rectangle101");

    obj.edit197 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit197:setParent(obj.rectangle101);
    obj.edit197:setTransparent(true);
    obj.edit197:setMargins({top=5,bottom=5});
    obj.edit197:setAlign("top");
    obj.edit197:setText("GRAD");
    obj.edit197:setHorzTextAlign("center");
    obj.edit197:setName("edit197");

    obj.edit198 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit198:setParent(obj.rectangle101);
    obj.edit198:setTransparent(true);
    obj.edit198:setMargins({bottom=5});
    obj.edit198:setAlign("top");
    obj.edit198:setText("CD");
    obj.edit198:setHorzTextAlign("center");
    obj.edit198:setName("edit198");

    obj.edit199 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit199:setParent(obj.rectangle101);
    obj.edit199:setTransparent(true);
    obj.edit199:setMargins({bottom=5});
    obj.edit199:setAlign("top");
    obj.edit199:setText("PODER");
    obj.edit199:setHorzTextAlign("center");
    obj.edit199:setName("edit199");

    obj.edit200 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit200:setParent(obj.rectangle101);
    obj.edit200:setTransparent(true);
    obj.edit200:setMargins({bottom=5});
    obj.edit200:setAlign("top");
    obj.edit200:setText("DANO");
    obj.edit200:setHorzTextAlign("center");
    obj.edit200:setName("edit200");

    obj.edit201 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit201:setParent(obj.rectangle101);
    obj.edit201:setTransparent(true);
    obj.edit201:setMargins({bottom=5});
    obj.edit201:setAlign("top");
    obj.edit201:setText("RANGE");
    obj.edit201:setHorzTextAlign("center");
    obj.edit201:setName("edit201");

    obj.edit202 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit202:setParent(obj.rectangle101);
    obj.edit202:setTransparent(true);
    obj.edit202:setMargins({bottom=5});
    obj.edit202:setAlign("top");
    obj.edit202:setText("AREA");
    obj.edit202:setHorzTextAlign("center");
    obj.edit202:setName("edit202");

    obj.edit203 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit203:setParent(obj.rectangle101);
    obj.edit203:setTransparent(true);
    obj.edit203:setMargins({bottom=5});
    obj.edit203:setAlign("top");
    obj.edit203:setText("DURAÇÃO");
    obj.edit203:setHorzTextAlign("center");
    obj.edit203:setName("edit203");

    obj.rectangle102 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle102:setParent(obj.layout115);
    obj.rectangle102:setAlign("left");
    obj.rectangle102:setWidth(100);
    obj.rectangle102:setColor("black");
    obj.rectangle102:setName("rectangle102");

    obj.edit204 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit204:setParent(obj.rectangle102);
    obj.edit204:setMargins({top=5,bottom=5});
    obj.edit204:setAlign("top");
    obj.edit204:setField("Grad2");
    obj.edit204:setHorzTextAlign("center");
    obj.edit204:setName("edit204");

    obj.edit205 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit205:setParent(obj.rectangle102);
    obj.edit205:setMargins({bottom=5});
    obj.edit205:setAlign("top");
    obj.edit205:setField("CD2");
    obj.edit205:setHorzTextAlign("center");
    obj.edit205:setName("edit205");

    obj.edit206 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit206:setParent(obj.rectangle102);
    obj.edit206:setMargins({bottom=5});
    obj.edit206:setAlign("top");
    obj.edit206:setField("Poder2");
    obj.edit206:setHorzTextAlign("center");
    obj.edit206:setName("edit206");

    obj.edit207 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit207:setParent(obj.rectangle102);
    obj.edit207:setMargins({bottom=5});
    obj.edit207:setAlign("top");
    obj.edit207:setField("Dano2");
    obj.edit207:setHorzTextAlign("center");
    obj.edit207:setName("edit207");

    obj.edit208 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit208:setParent(obj.rectangle102);
    obj.edit208:setMargins({bottom=5});
    obj.edit208:setAlign("top");
    obj.edit208:setField("Range2");
    obj.edit208:setHorzTextAlign("center");
    obj.edit208:setName("edit208");

    obj.edit209 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit209:setParent(obj.rectangle102);
    obj.edit209:setMargins({bottom=5});
    obj.edit209:setAlign("top");
    obj.edit209:setField("Area2");
    obj.edit209:setHorzTextAlign("center");
    obj.edit209:setName("edit209");

    obj.edit210 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit210:setParent(obj.rectangle102);
    obj.edit210:setMargins({bottom=5});
    obj.edit210:setAlign("top");
    obj.edit210:setField("Duracao2");
    obj.edit210:setHorzTextAlign("center");
    obj.edit210:setName("edit210");

    obj.layout116 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.popUp);
    obj.layout116:setAlign("left");
    obj.layout116:setWidth(100);
    obj.layout116:setName("layout116");

    obj.label139 = GUI.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout116);
    obj.label139:setAlign("top");
    obj.label139:setHeight(30);
    obj.label139:setText("Atual");
    obj.label139:setHorzTextAlign("center");
    obj.label139:setName("label139");

    obj.layout117 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout117:setParent(obj.layout116);
    obj.layout117:setAlign("top");
    obj.layout117:setHeight(360);
    obj.layout117:setName("layout117");

    obj.rectangle103 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle103:setParent(obj.layout117);
    obj.rectangle103:setAlign("left");
    obj.rectangle103:setWidth(100);
    obj.rectangle103:setColor("black");
    obj.rectangle103:setName("rectangle103");

    obj.edit211 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit211:setParent(obj.rectangle103);
    obj.edit211:setMargins({top=5,bottom=5});
    obj.edit211:setAlign("top");
    obj.edit211:setField("Grad");
    obj.edit211:setHorzTextAlign("center");
    obj.edit211:setName("edit211");

    obj.edit212 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit212:setParent(obj.rectangle103);
    obj.edit212:setMargins({bottom=5});
    obj.edit212:setAlign("top");
    obj.edit212:setField("CD");
    obj.edit212:setHorzTextAlign("center");
    obj.edit212:setName("edit212");

    obj.edit213 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit213:setParent(obj.rectangle103);
    obj.edit213:setMargins({bottom=5});
    obj.edit213:setAlign("top");
    obj.edit213:setField("Poder");
    obj.edit213:setHorzTextAlign("center");
    obj.edit213:setName("edit213");

    obj.edit214 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit214:setParent(obj.rectangle103);
    obj.edit214:setMargins({bottom=5});
    obj.edit214:setAlign("top");
    obj.edit214:setField("Dano");
    obj.edit214:setHorzTextAlign("center");
    obj.edit214:setName("edit214");

    obj.edit215 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit215:setParent(obj.rectangle103);
    obj.edit215:setMargins({bottom=5});
    obj.edit215:setAlign("top");
    obj.edit215:setField("Range");
    obj.edit215:setHorzTextAlign("center");
    obj.edit215:setName("edit215");

    obj.edit216 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit216:setParent(obj.rectangle103);
    obj.edit216:setMargins({bottom=5});
    obj.edit216:setAlign("top");
    obj.edit216:setField("Area");
    obj.edit216:setHorzTextAlign("center");
    obj.edit216:setName("edit216");

    obj.edit217 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit217:setParent(obj.rectangle103);
    obj.edit217:setMargins({bottom=5});
    obj.edit217:setAlign("top");
    obj.edit217:setField("Duracao");
    obj.edit217:setHorzTextAlign("center");
    obj.edit217:setName("edit217");

    obj.layout118 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout118:setParent(obj.popUp);
    obj.layout118:setAlign("left");
    obj.layout118:setWidth(280);
    obj.layout118:setMargins({left=10});
    obj.layout118:setName("layout118");

    obj.label140 = GUI.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.layout118);
    obj.label140:setAlign("top");
    obj.label140:setHeight(30);
    obj.label140:setText("Descrição");
    obj.label140:setHorzTextAlign("center");
    obj.label140:setName("label140");

    obj.label141 = GUI.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout118);
    obj.label141:setAlign("top");
    obj.label141:setHeight(70);
    obj.label141:setMargins({top=10});
    obj.label141:setAutoSize(true);
    obj.label141:setField("Desc");
    obj.label141:setHorzTextAlign("center");
    obj.label141:setName("label141");

    obj.label142 = GUI.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.layout118);
    obj.label142:setAlign("top");
    obj.label142:setHeight(50);
    obj.label142:setText("Efeito");
    obj.label142:setHorzTextAlign("center");
    obj.label142:setName("label142");

    obj.label143 = GUI.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout118);
    obj.label143:setAlign("top");
    obj.label143:setHeight(70);
    obj.label143:setMargins({top=10});
    obj.label143:setAutoSize(true);
    obj.label143:setField("Efeito");
    obj.label143:setHorzTextAlign("center");
    obj.label143:setName("label143");

    obj.label144 = GUI.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.layout118);
    obj.label144:setAlign("top");
    obj.label144:setHeight(30);
    obj.label144:setText("Bonus");
    obj.label144:setHorzTextAlign("center");
    obj.label144:setName("label144");

    obj.label145 = GUI.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout118);
    obj.label145:setAlign("top");
    obj.label145:setHeight(70);
    obj.label145:setMargins({top=10});
    obj.label145:setAutoSize(true);
    obj.label145:setField("Bonus");
    obj.label145:setHorzTextAlign("center");
    obj.label145:setName("label145");

    obj.layout119 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout119:setParent(obj.popUp);
    obj.layout119:setAlign("bottom");
    obj.layout119:setMargins({top=10});
    obj.layout119:setName("layout119");

    obj.button29 = GUI.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.layout119);
    obj.button29:setAlign("top");
    obj.button29:setText("Fechar");
    obj.button29:setName("button29");

    obj.button30 = GUI.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.layout119);
    obj.button30:setAlign("top");
    obj.button30:setText("Enviar na Mesa");
    obj.button30:setName("button30");

    obj.tab10 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab10:setParent(obj.tabControl1);
    obj.tab10:setTitle("Anotações");
    obj.tab10:setName("tab10");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.tab10);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.tabControl4 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl4:setParent(obj.scrollBox4);
    obj.tabControl4:setAlign("client");
    obj.tabControl4:setName("tabControl4");

    obj.tab11 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab11:setParent(obj.tabControl4);
    obj.tab11:setTitle("Primeira Aba");
    obj.tab11:setName("tab11");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.tab11);
    obj.richEdit1:setAlign("client");
    obj.richEdit1.backgroundColor = "black";
    obj.richEdit1.defaultFontColor = "white";
    obj.richEdit1:setField("txt1");
    obj.richEdit1:setName("richEdit1");

    obj.tab12 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab12:setParent(obj.tabControl4);
    obj.tab12:setTitle("Segunda Aba");
    obj.tab12:setName("tab12");

    obj.richEdit2 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.tab12);
    obj.richEdit2:setAlign("client");
    obj.richEdit2.backgroundColor = "black";
    obj.richEdit2.defaultFontColor = "white";
    obj.richEdit2:setField("txt2");
    obj.richEdit2:setName("richEdit2");

    obj.tab13 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab13:setParent(obj.tabControl4);
    obj.tab13:setTitle("Terceira Aba");
    obj.tab13:setName("tab13");

    obj.richEdit3 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit3:setParent(obj.tab13);
    obj.richEdit3:setAlign("client");
    obj.richEdit3.backgroundColor = "black";
    obj.richEdit3.defaultFontColor = "white";
    obj.richEdit3:setField("txt3");
    obj.richEdit3:setName("richEdit3");

    obj.tab14 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab14:setParent(obj.tabControl4);
    obj.tab14:setTitle("Quarta Aba");
    obj.tab14:setName("tab14");

    obj.richEdit4 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit4:setParent(obj.tab14);
    obj.richEdit4:setAlign("client");
    obj.richEdit4.backgroundColor = "black";
    obj.richEdit4.defaultFontColor = "white";
    obj.richEdit4:setField("txt4");
    obj.richEdit4:setName("richEdit4");

    obj.tab15 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab15:setParent(obj.tabControl4);
    obj.tab15:setTitle("Quinta Aba");
    obj.tab15:setName("tab15");

    obj.richEdit5 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit5:setParent(obj.tab15);
    obj.richEdit5:setAlign("client");
    obj.richEdit5.backgroundColor = "black";
    obj.richEdit5.defaultFontColor = "white";
    obj.richEdit5:setField("txt5");
    obj.richEdit5:setName("richEdit5");

    obj.tab16 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab16:setParent(obj.tabControl4);
    obj.tab16:setTitle("Sexta Aba");
    obj.tab16:setName("tab16");

    obj.richEdit6 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit6:setParent(obj.tab16);
    obj.richEdit6:setAlign("client");
    obj.richEdit6.backgroundColor = "black";
    obj.richEdit6.defaultFontColor = "white";
    obj.richEdit6:setField("txt6");
    obj.richEdit6:setName("richEdit6");

    obj.tab17 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab17:setParent(obj.tabControl4);
    obj.tab17:setTitle("Setima Aba");
    obj.tab17:setName("tab17");

    obj.richEdit7 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit7:setParent(obj.tab17);
    obj.richEdit7:setAlign("client");
    obj.richEdit7.backgroundColor = "black";
    obj.richEdit7.defaultFontColor = "white";
    obj.richEdit7:setField("txt7");
    obj.richEdit7:setName("richEdit7");

    obj.tab18 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab18:setParent(obj.tabControl4);
    obj.tab18:setTitle("Oitava Aba");
    obj.tab18:setName("tab18");

    obj.richEdit8 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit8:setParent(obj.tab18);
    obj.richEdit8:setAlign("client");
    obj.richEdit8.backgroundColor = "black";
    obj.richEdit8.defaultFontColor = "white";
    obj.richEdit8:setField("txt8");
    obj.richEdit8:setName("richEdit8");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function ()
            local campos =
                      {"DES","adivinhacao","azaracao","contraFeitico","encantamento","feitico","transmutacao","arteDasTrevas","fisico","mental","concentracao","acerto"}
                      for x = 1, #campos, 1 do
            
                      if sheet[campos[x]] == nil then
                      sheet[campos[x]] = 0
                      end
            
                      end
        end);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            -- CORPO
            
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
            
                           -- MENTE
            
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
            
                           sheet.INV_Total = (tonumber(sheet.INV_Grad) or 0) +
                           (tonumber(sheet.INTE) or 0) +
                           (tonumber(sheet.INV_Out) or 0)
            
                           sheet.PERC_Total = (tonumber(sheet.PERC_Grad) or 0) +
                           (tonumber(sheet.SAB) or 0) +
                           (tonumber(sheet.PERC_Out) or 0)
            
                           sheet.PERS_Total = (tonumber(sheet.PERS_Grad) or 0) +
                           (tonumber(sheet.PRE) or 0) +
                           (tonumber(sheet.PERS_Out) or 0)
            
                           sheet.TRA_Total = (tonumber(sheet.TRA_Grad) or 0) +
                           (tonumber(sheet.INTE) or 0) +
                           (tonumber(sheet.TRA_Out) or 0)
            
                           -- CONHECIMENTOS
            
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
            
                           -- DEFESAS
            
                           sheet.INI_Total = (tonumber(sheet.INI_Grad) or 0) +
                           (tonumber(sheet.AGI) or 0) +
                           (tonumber(sheet.INI_OUT) or 0)
            
                           sheet.APA_Total = (tonumber(sheet.APA_Grad) or 0) +
                           (tonumber(sheet.LUT) or 0) +
                           (tonumber(sheet.APA_Out) or 0)
            
                           sheet.FORT_Total = (tonumber(sheet.FORT_Grad) or 0) +
                           (tonumber(sheet.VIG) or 0) +
                           (tonumber(sheet.FORT_Out) or 0)
            
                           sheet.REF_Total = (tonumber(sheet.REF_Grad) or 0) +
                           (tonumber(sheet.AGI) or 0) +
                           (tonumber(sheet.REF_Out) or 0)
            
                           sheet.RES_Total = (tonumber(sheet.RES_Grad) or 0) +
                           (tonumber(sheet.VIG) or 0) +
                           (tonumber(sheet.RES_Out) or 0)
            
                           sheet.VON_Total = (tonumber(sheet.VON_Grad) or 0) +
                           (tonumber(sheet.SAB) or 0) +
                           (tonumber(sheet.VON_Out) or 0)
            
                           -- QUADRIBOL
            
                           sheet.ANTE_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) + (tonumber(sheet.SAB) or 0)
                           +
                           (tonumber(sheet.ANTE_QUAD_OUT) or 0)
            
                           sheet.APAN_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) + (tonumber(sheet.DES) or 0)
                           +
                           (tonumber(sheet.APAN_QUAD_OUT) or 0)
            
                           sheet.ATRA_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) + (tonumber(sheet.INTE) or 0)
                           +
                           (tonumber(sheet.ATRA_QUAD_OUT) or 0)
            
                           sheet.DRI_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) + (tonumber(sheet.AGI) or 0)
                           +
                           (tonumber(sheet.DRI_QUAD_OUT) or 0)
            
                           sheet.GOL_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) + (tonumber(sheet.FOR) or 0)
                           +
                           (tonumber(sheet.GOL_QUAD_OUT) or 0)
            
                           sheet.FALTA_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) + (tonumber(sheet.PRE) or 0)
                           +
                           (tonumber(sheet.FALTA_QUAD_OUT) or 0)
            
                           sheet.PASS_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) + (tonumber(sheet.FOR) or 0)
                           +
                           (tonumber(sheet.PASS_QUAD_OUT) or 0)
            
                           sheet.REBA_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) + (tonumber(sheet.FOR) or 0)
                           +
                           (tonumber(sheet.REBA_QUAD_OUT) or 0)
            
                           sheet.ROU_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) + (tonumber(sheet.LUT) or 0)
                           +
                           (tonumber(sheet.ROU_QUAD_OUT) or 0)
            
                           sheet.VEL_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) + (tonumber(sheet.AGI) or 0)
                           +
                           (tonumber(sheet.VEL_QUAD_OUT) or 0)
            
                           sheet.DEFE_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) + (tonumber(sheet.AGI) or 0)
                           +
                           (tonumber(sheet.DEFE_QUAD_OUT) or 0)
            
                           sheet.GOL_MOD = cadaDez(sheet.GOL_QUAD_TOTAL + 10) .. "q"
                           sheet.PAS_MOD = cadaDez(sheet.PASS_QUAD_TOTAL + 10) .. "q"
                           sheet.REB_MOD = cadaDez(sheet.REBA_QUAD_TOTAL + 10) .. "q"
                           sheet.VEL_MOD = cadaDez(sheet.VEL_QUAD_TOTAL + 10) .. "q"
            
                           local function pontos()
            
                           local corpo = tonumber(sheet.ACR_Grad or 0) + tonumber(sheet.ATL_Grad or 0)
                           + tonumber(sheet.VEI_Grad or 0) + tonumber(sheet.FUR_Grad or 0)
                           + tonumber(sheet.PRE_Grad or 0)
            
                           local mente = tonumber(sheet.ENG_Grad or 0) + tonumber(sheet.INTU_Grad or 0) +
                           tonumber(sheet.INV_Grad or 0) + tonumber(sheet.PERC_Grad or 0) +
                           tonumber(sheet.PERS_Grad or 0) + tonumber(sheet.TRA_Grad or 0) +
                           tonumber(sheet.INT_Grad or 0) + tonumber(sheet.CON_Grad or 0)
            
                           local conhecimentos = tonumber(sheet.ATU_Grad or 0) + tonumber(sheet.C_ADI_Grad or 0)
                           + tonumber(sheet.C_AZA_Grad or 0) +
                           tonumber(sheet.C_CON_Grad or 0) + tonumber(sheet.C_CRI_Grad or 0) +
                           tonumber(sheet.C_ENC_Grad or 0) + tonumber(sheet.C_FEI_Grad or 0) +
                           tonumber(sheet.C_HER_Grad or 0) + tonumber(sheet.C_MAL_Grad or 0) +
                           tonumber(sheet.C_POC_Grad or 0) + tonumber(sheet.C_RUN_Grad or 0) +
                           tonumber(sheet.C_TRA_Grad or 0)
            
                           local feiticosCadastrados = NDB.getChildNodes(sheet.magias)
                           local totalFeiticos = 0
            
                           for x = 1, #feiticosCadastrados, 1 do
                           totalFeiticos = totalFeiticos + tonumber(feiticosCadastrados[x].GRAD or 0) 
                           end
            
                           local feiticos = tonumber(sheet.ACR_Grad or 0) + tonumber(sheet.ATL_Grad or 0)
                           + tonumber(sheet.VEI_Grad or 0) + tonumber(sheet.FUR_Grad or 0)
                           + tonumber(sheet.PRE_Grad or 0)
            
                           local atributos = tonumber(sheet.AGI or 0) + tonumber(sheet.DES or 0) +
                           tonumber(sheet.FOR or 0) + tonumber(sheet.LUT or 0) + tonumber(sheet.VIG or 0) +
                           tonumber(sheet.INTE or 0) + tonumber(sheet.PRE or 0) + tonumber(sheet.SAB or 0)
            
                           local defesas = tonumber(sheet.INI_Grad or 0) + tonumber(sheet.APA_Grad or 0) +
                           tonumber(sheet.FORT_Grad or 0) + tonumber(sheet.REF_Grad or 0) +
                           tonumber(sheet.RES_Grad or 0) + tonumber(sheet.VON_Grad or 0)
            
                           sheet.pontosDefesas = "Defesas - " .. defesas
                           sheet.pontosAtributos = "Atributos - " .. atributos * 2
                           sheet.pontosPericias = "Pericias - " .. ((corpo + mente + conhecimentos) / 2)
                           sheet.pontosFeiticos = "Feiticos - " .. totalFeiticos
                           end
            
                           pontos()
        end);

    obj._e_event2 = obj.checkBox1:addEventListener("onChange",
        function ()
            local mesaDoPersonagem = Firecast.getRoomOf(sheet);
                                local chat = mesaDoPersonagem.chat
                                local jogador = mesaDoPersonagem.meuJogador
                                local root = NDB.getRoot(sheet)
                                local nick = root.nomePersonagem or jogador.nick
            
                                if sheet.Fadigado then
            
                                    if self.Fadigado.text == "Exausto" and sheet.Fadigado then
            
                                        sheet.Fadigado = nil
                                        chat:enviarMensagem(nick .. " estava Fatigado agora está " ..
                                        self.Fadigado.text)
            
                                    elseif self.Fadigado.text == "Fadigado" and sheet.Exausto  then
            
                                        sheet.Exausto = nil
                                        chat:enviarMensagem(nick .. " estava Exausto agora está " ..
                                        self.Fadigado.text)
            
                                    elseif self.Fadigado.text == "Tiltado" and sheet.Frustrado  then
            
                                        sheet.Frustrado = nil
                                        chat:enviarMensagem(nick .. " estava Frustrado agora está " ..
                                        self.Fadigado.text)
            
                                    elseif self.Fadigado.text == "Frustrado" and sheet.Tiltado  then
            
                                        sheet.Tiltado = nil
                                        chat:enviarMensagem(nick .. " estava Tiltado agora está " ..
                                        self.Fadigado.text)
                                        
                                    else
                                        chat:enviarMensagem(nick .. " está " .. self.Fadigado.text)
            
                                    end
            
                                else
                                    chat:enviarMensagem(nick .. " não está mais " .. self.Fadigado.text)
                                end
        end);

    obj._e_event3 = obj.checkBox2:addEventListener("onChange",
        function ()
            local mesaDoPersonagem = Firecast.getRoomOf(sheet);
                                local chat = mesaDoPersonagem.chat
                                local jogador = mesaDoPersonagem.meuJogador
                                local root = NDB.getRoot(sheet)
                                local nick = root.nomePersonagem or jogador.nick
            
                                if sheet.Exausto then
            
                                    if self.Exausto.text == "Exausto" and sheet.Fadigado then
            
                                        sheet.Fadigado = nil
                                        chat:enviarMensagem(nick .. " estava Fatigado agora está " ..
                                        self.Exausto.text)
            
                                    elseif self.Exausto.text == "Fadigado" and sheet.Exausto  then
            
                                        sheet.Exausto = nil
                                        chat:enviarMensagem(nick .. " estava Exausto agora está " ..
                                        self.Exausto.text)
            
                                    elseif self.Exausto.text == "Tiltado" and sheet.Frustrado  then
            
                                        sheet.Frustrado = nil
                                        chat:enviarMensagem(nick .. " estava Frustrado agora está " ..
                                        self.Exausto.text)
            
                                    elseif self.Exausto.text == "Frustrado" and sheet.Tiltado  then
            
                                        sheet.Tiltado = nil
                                        chat:enviarMensagem(nick .. " estava Tiltado agora está " ..
                                        self.Exausto.text)
                                        
                                    else
                                        chat:enviarMensagem(nick .. " está " .. self.Exausto.text)
            
                                    end
            
                                else
                                    chat:enviarMensagem(nick .. " não está mais " .. self.Exausto.text)
                                end
        end);

    obj._e_event4 = obj.checkBox3:addEventListener("onChange",
        function ()
            local mesaDoPersonagem = Firecast.getRoomOf(sheet);
                                local chat = mesaDoPersonagem.chat
                                local jogador = mesaDoPersonagem.meuJogador
                                local root = NDB.getRoot(sheet)
                                local nick = root.nomePersonagem or jogador.nick
            
                                if sheet.Frustrado then
            
                                    if self.Frustrado.text == "Exausto" and sheet.Fadigado then
            
                                        sheet.Fadigado = nil
                                        chat:enviarMensagem(nick .. " estava Fatigado agora está " ..
                                        self.Frustrado.text)
            
                                    elseif self.Frustrado.text == "Fadigado" and sheet.Exausto  then
            
                                        sheet.Exausto = nil
                                        chat:enviarMensagem(nick .. " estava Exausto agora está " ..
                                        self.Frustrado.text)
            
                                    elseif self.Frustrado.text == "Tiltado" and sheet.Frustrado  then
            
                                        sheet.Frustrado = nil
                                        chat:enviarMensagem(nick .. " estava Frustrado agora está " ..
                                        self.Frustrado.text)
            
                                    elseif self.Frustrado.text == "Frustrado" and sheet.Tiltado  then
            
                                        sheet.Tiltado = nil
                                        chat:enviarMensagem(nick .. " estava Tiltado agora está " ..
                                        self.Frustrado.text)
                                        
                                    else
                                        chat:enviarMensagem(nick .. " está " .. self.Frustrado.text)
            
                                    end
            
                                else
                                    chat:enviarMensagem(nick .. " não está mais " .. self.Frustrado.text)
                                end
        end);

    obj._e_event5 = obj.checkBox4:addEventListener("onChange",
        function ()
            local mesaDoPersonagem = Firecast.getRoomOf(sheet);
                                local chat = mesaDoPersonagem.chat
                                local jogador = mesaDoPersonagem.meuJogador
                                local root = NDB.getRoot(sheet)
                                local nick = root.nomePersonagem or jogador.nick
            
                                if sheet.Tiltado then
            
                                    if self.Tiltado.text == "Exausto" and sheet.Fadigado then
            
                                        sheet.Fadigado = nil
                                        chat:enviarMensagem(nick .. " estava Fatigado agora está " ..
                                        self.Tiltado.text)
            
                                    elseif self.Tiltado.text == "Fadigado" and sheet.Exausto  then
            
                                        sheet.Exausto = nil
                                        chat:enviarMensagem(nick .. " estava Exausto agora está " ..
                                        self.Tiltado.text)
            
                                    elseif self.Tiltado.text == "Tiltado" and sheet.Frustrado  then
            
                                        sheet.Frustrado = nil
                                        chat:enviarMensagem(nick .. " estava Frustrado agora está " ..
                                        self.Tiltado.text)
            
                                    elseif self.Tiltado.text == "Frustrado" and sheet.Tiltado  then
            
                                        sheet.Tiltado = nil
                                        chat:enviarMensagem(nick .. " estava Tiltado agora está " ..
                                        self.Tiltado.text)
                                        
                                    else
                                        chat:enviarMensagem(nick .. " está " .. self.Tiltado.text)
            
                                    end
            
                                else
                                    chat:enviarMensagem(nick .. " não está mais " .. self.Tiltado.text)
                                end
        end);

    obj._e_event6 = obj.rectangle11:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                            local chat = mesaDoPersonagem.chat
                            local nodeMain = NDB.getRoot(sheet)
            
                            local function condition()
            
                            if self.AGILIDADE.text == "AGILIDADE" or
                            self.AGILIDADE.text == "DESTREZA" or
                            self.AGILIDADE.text == "FORÇA" or
                            self.AGILIDADE.text == "LUTA" or
                            self.AGILIDADE.text == "VIGOR" then
            
                            if sheet.Exausto then
                            return -5
                            end
            
                            if sheet.Fadigado then
                            return -2
                            end
            
                            else
            
                            if sheet.Tiltado then
                            return -5
                            end
            
                            if sheet.Frustrado then
                            return -2
                            end
            
                            end
            
                            return nil
                            end
            
            
                            chat:rolarDados("1d20 + " .. (sheet.AGI_OUT or sheet.AGI) .. (condition()
                            and (condition()) or ""),
                            (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.AGILIDADE.text,
                            function (rolado)
            
                            end);
        end);

    obj._e_event7 = obj.rectangle12:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                            local chat = mesaDoPersonagem.chat
                            local nodeMain = NDB.getRoot(sheet)
            
                            local function condition()
            
                            if self.DESTREZA.text == "AGILIDADE" or
                            self.DESTREZA.text == "DESTREZA" or
                            self.DESTREZA.text == "FORÇA" or
                            self.DESTREZA.text == "LUTA" or
                            self.DESTREZA.text == "VIGOR" then
            
                            if sheet.Exausto then
                            return -5
                            end
            
                            if sheet.Fadigado then
                            return -2
                            end
            
                            else
            
                            if sheet.Tiltado then
                            return -5
                            end
            
                            if sheet.Frustrado then
                            return -2
                            end
            
                            end
            
                            return nil
                            end
            
            
                            chat:rolarDados("1d20 + " .. (sheet.DES_OUT or sheet.DES) .. (condition()
                            and (condition()) or ""),
                            (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.DESTREZA.text,
                            function (rolado)
            
                            end);
        end);

    obj._e_event8 = obj.rectangle13:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                            local chat = mesaDoPersonagem.chat
                            local nodeMain = NDB.getRoot(sheet)
            
                            local function condition()
            
                            if self.FORCA.text == "AGILIDADE" or
                            self.FORCA.text == "DESTREZA" or
                            self.FORCA.text == "FORÇA" or
                            self.FORCA.text == "LUTA" or
                            self.FORCA.text == "VIGOR" then
            
                            if sheet.Exausto then
                            return -5
                            end
            
                            if sheet.Fadigado then
                            return -2
                            end
            
                            else
            
                            if sheet.Tiltado then
                            return -5
                            end
            
                            if sheet.Frustrado then
                            return -2
                            end
            
                            end
            
                            return nil
                            end
            
            
                            chat:rolarDados("1d20 + " .. (sheet.FOR_OUT or sheet.FOR) .. (condition()
                            and (condition()) or ""),
                            (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.FORCA.text,
                            function (rolado)
            
                            end);
        end);

    obj._e_event9 = obj.rectangle14:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                            local chat = mesaDoPersonagem.chat
                            local nodeMain = NDB.getRoot(sheet)
            
                            local function condition()
            
                            if self.LUTA.text == "AGILIDADE" or
                            self.LUTA.text == "DESTREZA" or
                            self.LUTA.text == "FORÇA" or
                            self.LUTA.text == "LUTA" or
                            self.LUTA.text == "VIGOR" then
            
                            if sheet.Exausto then
                            return -5
                            end
            
                            if sheet.Fadigado then
                            return -2
                            end
            
                            else
            
                            if sheet.Tiltado then
                            return -5
                            end
            
                            if sheet.Frustrado then
                            return -2
                            end
            
                            end
            
                            return nil
                            end
            
            
                            chat:rolarDados("1d20 + " .. (sheet.LUT_OUT or sheet.LUT) .. (condition()
                            and (condition()) or ""),
                            (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.LUTA.text,
                            function (rolado)
            
                            end);
        end);

    obj._e_event10 = obj.rectangle15:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                            local chat = mesaDoPersonagem.chat
                            local nodeMain = NDB.getRoot(sheet)
            
                            local function condition()
            
                            if self.VIGOR.text == "AGILIDADE" or
                            self.VIGOR.text == "DESTREZA" or
                            self.VIGOR.text == "FORÇA" or
                            self.VIGOR.text == "LUTA" or
                            self.VIGOR.text == "VIGOR" then
            
                            if sheet.Exausto then
                            return -5
                            end
            
                            if sheet.Fadigado then
                            return -2
                            end
            
                            else
            
                            if sheet.Tiltado then
                            return -5
                            end
            
                            if sheet.Frustrado then
                            return -2
                            end
            
                            end
            
                            return nil
                            end
            
            
                            chat:rolarDados("1d20 + " .. (sheet.VIG_OUT or sheet.VIG) .. (condition()
                            and (condition()) or ""),
                            (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.VIGOR.text,
                            function (rolado)
            
                            end);
        end);

    obj._e_event11 = obj.rectangle17:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                            local chat = mesaDoPersonagem.chat
                            local nodeMain = NDB.getRoot(sheet)
            
                            local function condition()
            
                            if self.INTELIGENCIA.text == "AGILIDADE" or
                            self.INTELIGENCIA.text == "DESTREZA" or
                            self.INTELIGENCIA.text == "FORÇA" or
                            self.INTELIGENCIA.text == "LUTA" or
                            self.INTELIGENCIA.text == "VIGOR" then
            
                            if sheet.Exausto then
                            return -5
                            end
            
                            if sheet.Fadigado then
                            return -2
                            end
            
                            else
            
                            if sheet.Tiltado then
                            return -5
                            end
            
                            if sheet.Frustrado then
                            return -2
                            end
            
                            end
            
                            return nil
                            end
            
            
                            chat:rolarDados("1d20 + " .. (sheet.INTE_OUT or sheet.INTE) .. (condition()
                            and (condition()) or ""),
                            (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.INTELIGENCIA.text,
                            function (rolado)
            
                            end);
        end);

    obj._e_event12 = obj.rectangle18:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                            local chat = mesaDoPersonagem.chat
                            local nodeMain = NDB.getRoot(sheet)
            
                            local function condition()
            
                            if self.PRESENCA.text == "AGILIDADE" or
                            self.PRESENCA.text == "DESTREZA" or
                            self.PRESENCA.text == "FORÇA" or
                            self.PRESENCA.text == "LUTA" or
                            self.PRESENCA.text == "VIGOR" then
            
                            if sheet.Exausto then
                            return -5
                            end
            
                            if sheet.Fadigado then
                            return -2
                            end
            
                            else
            
                            if sheet.Tiltado then
                            return -5
                            end
            
                            if sheet.Frustrado then
                            return -2
                            end
            
                            end
            
                            return nil
                            end
            
            
                            chat:rolarDados("1d20 + " .. (sheet.PRES_OUT or sheet.PRE) .. (condition()
                            and (condition()) or ""),
                            (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.PRESENCA.text,
                            function (rolado)
            
                            end);
        end);

    obj._e_event13 = obj.rectangle19:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                            local chat = mesaDoPersonagem.chat
                            local nodeMain = NDB.getRoot(sheet)
            
                            local function condition()
            
                            if self.SABEDORIA.text == "AGILIDADE" or
                            self.SABEDORIA.text == "DESTREZA" or
                            self.SABEDORIA.text == "FORÇA" or
                            self.SABEDORIA.text == "LUTA" or
                            self.SABEDORIA.text == "VIGOR" then
            
                            if sheet.Exausto then
                            return -5
                            end
            
                            if sheet.Fadigado then
                            return -2
                            end
            
                            else
            
                            if sheet.Tiltado then
                            return -5
                            end
            
                            if sheet.Frustrado then
                            return -2
                            end
            
                            end
            
                            return nil
                            end
            
            
                            chat:rolarDados("1d20 + " .. (sheet.SAB_OUT or sheet.SAB) .. (condition()
                            and (condition()) or ""),
                            (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.SABEDORIA.text,
                            function (rolado)
            
                            end);
        end);

    obj._e_event14 = obj.rectangle20:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.Acrobacia.text == "Acrobacia" or
                                self.Acrobacia.text == "Atletismo" or
                                self.Acrobacia.text == "Corpo-a-Corpo" or
                                self.Acrobacia.text == "Furtividade" or
                                self.Acrobacia.text == "Prestidigitação" or
                                self.Acrobacia.text == "Veiculos Mágicos" or
                                self.Acrobacia.text == "Iniciativa" or
                                self.Acrobacia.text == "Aparar" or
                                self.Acrobacia.text == "Fortitude" or
                                self.Acrobacia.text == "Reflexo" or
                                self.Acrobacia.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.ACR_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.Acrobacia.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event15 = obj.rectangle21:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.Atletismo.text == "Acrobacia" or
                                self.Atletismo.text == "Atletismo" or
                                self.Atletismo.text == "Corpo-a-Corpo" or
                                self.Atletismo.text == "Furtividade" or
                                self.Atletismo.text == "Prestidigitação" or
                                self.Atletismo.text == "Veiculos Mágicos" or
                                self.Atletismo.text == "Iniciativa" or
                                self.Atletismo.text == "Aparar" or
                                self.Atletismo.text == "Fortitude" or
                                self.Atletismo.text == "Reflexo" or
                                self.Atletismo.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.ATL_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.Atletismo.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event16 = obj.rectangle22:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.CorpoACorpo.text == "Acrobacia" or
                                self.CorpoACorpo.text == "Atletismo" or
                                self.CorpoACorpo.text == "Corpo-a-Corpo" or
                                self.CorpoACorpo.text == "Furtividade" or
                                self.CorpoACorpo.text == "Prestidigitação" or
                                self.CorpoACorpo.text == "Veiculos Mágicos" or
                                self.CorpoACorpo.text == "Iniciativa" or
                                self.CorpoACorpo.text == "Aparar" or
                                self.CorpoACorpo.text == "Fortitude" or
                                self.CorpoACorpo.text == "Reflexo" or
                                self.CorpoACorpo.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.COR_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.CorpoACorpo.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event17 = obj.rectangle23:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.Furtividade.text == "Acrobacia" or
                                self.Furtividade.text == "Atletismo" or
                                self.Furtividade.text == "Corpo-a-Corpo" or
                                self.Furtividade.text == "Furtividade" or
                                self.Furtividade.text == "Prestidigitação" or
                                self.Furtividade.text == "Veiculos Mágicos" or
                                self.Furtividade.text == "Iniciativa" or
                                self.Furtividade.text == "Aparar" or
                                self.Furtividade.text == "Fortitude" or
                                self.Furtividade.text == "Reflexo" or
                                self.Furtividade.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.FUR_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.Furtividade.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event18 = obj.rectangle24:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.Prestidigitacao.text == "Acrobacia" or
                                self.Prestidigitacao.text == "Atletismo" or
                                self.Prestidigitacao.text == "Corpo-a-Corpo" or
                                self.Prestidigitacao.text == "Furtividade" or
                                self.Prestidigitacao.text == "Prestidigitação" or
                                self.Prestidigitacao.text == "Veiculos Mágicos" or
                                self.Prestidigitacao.text == "Iniciativa" or
                                self.Prestidigitacao.text == "Aparar" or
                                self.Prestidigitacao.text == "Fortitude" or
                                self.Prestidigitacao.text == "Reflexo" or
                                self.Prestidigitacao.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.PRE_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.Prestidigitacao.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event19 = obj.rectangle25:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.VeiculosMagicos.text == "Acrobacia" or
                                self.VeiculosMagicos.text == "Atletismo" or
                                self.VeiculosMagicos.text == "Corpo-a-Corpo" or
                                self.VeiculosMagicos.text == "Furtividade" or
                                self.VeiculosMagicos.text == "Prestidigitação" or
                                self.VeiculosMagicos.text == "Veiculos Mágicos" or
                                self.VeiculosMagicos.text == "Iniciativa" or
                                self.VeiculosMagicos.text == "Aparar" or
                                self.VeiculosMagicos.text == "Fortitude" or
                                self.VeiculosMagicos.text == "Reflexo" or
                                self.VeiculosMagicos.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.VEI_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.VeiculosMagicos.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event20 = obj.rectangle26:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.Concentracao.text == "Acrobacia" or
                                self.Concentracao.text == "Atletismo" or
                                self.Concentracao.text == "Corpo-a-Corpo" or
                                self.Concentracao.text == "Furtividade" or
                                self.Concentracao.text == "Prestidigitação" or
                                self.Concentracao.text == "Veiculos Mágicos" or
                                self.Concentracao.text == "Iniciativa" or
                                self.Concentracao.text == "Aparar" or
                                self.Concentracao.text == "Fortitude" or
                                self.Concentracao.text == "Reflexo" or
                                self.Concentracao.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.CON_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.Concentracao.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event21 = obj.rectangle27:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.Enganacao.text == "Acrobacia" or
                                self.Enganacao.text == "Atletismo" or
                                self.Enganacao.text == "Corpo-a-Corpo" or
                                self.Enganacao.text == "Furtividade" or
                                self.Enganacao.text == "Prestidigitação" or
                                self.Enganacao.text == "Veiculos Mágicos" or
                                self.Enganacao.text == "Iniciativa" or
                                self.Enganacao.text == "Aparar" or
                                self.Enganacao.text == "Fortitude" or
                                self.Enganacao.text == "Reflexo" or
                                self.Enganacao.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.ENG_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.Enganacao.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event22 = obj.rectangle28:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.Intimidacao.text == "Acrobacia" or
                                self.Intimidacao.text == "Atletismo" or
                                self.Intimidacao.text == "Corpo-a-Corpo" or
                                self.Intimidacao.text == "Furtividade" or
                                self.Intimidacao.text == "Prestidigitação" or
                                self.Intimidacao.text == "Veiculos Mágicos" or
                                self.Intimidacao.text == "Iniciativa" or
                                self.Intimidacao.text == "Aparar" or
                                self.Intimidacao.text == "Fortitude" or
                                self.Intimidacao.text == "Reflexo" or
                                self.Intimidacao.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.INT_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.Intimidacao.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event23 = obj.rectangle29:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.Intuicao.text == "Acrobacia" or
                                self.Intuicao.text == "Atletismo" or
                                self.Intuicao.text == "Corpo-a-Corpo" or
                                self.Intuicao.text == "Furtividade" or
                                self.Intuicao.text == "Prestidigitação" or
                                self.Intuicao.text == "Veiculos Mágicos" or
                                self.Intuicao.text == "Iniciativa" or
                                self.Intuicao.text == "Aparar" or
                                self.Intuicao.text == "Fortitude" or
                                self.Intuicao.text == "Reflexo" or
                                self.Intuicao.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.INTU_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.Intuicao.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event24 = obj.rectangle30:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.Investigacao.text == "Acrobacia" or
                                self.Investigacao.text == "Atletismo" or
                                self.Investigacao.text == "Corpo-a-Corpo" or
                                self.Investigacao.text == "Furtividade" or
                                self.Investigacao.text == "Prestidigitação" or
                                self.Investigacao.text == "Veiculos Mágicos" or
                                self.Investigacao.text == "Iniciativa" or
                                self.Investigacao.text == "Aparar" or
                                self.Investigacao.text == "Fortitude" or
                                self.Investigacao.text == "Reflexo" or
                                self.Investigacao.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.INV_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.Investigacao.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event25 = obj.rectangle31:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.Percepcao.text == "Acrobacia" or
                                self.Percepcao.text == "Atletismo" or
                                self.Percepcao.text == "Corpo-a-Corpo" or
                                self.Percepcao.text == "Furtividade" or
                                self.Percepcao.text == "Prestidigitação" or
                                self.Percepcao.text == "Veiculos Mágicos" or
                                self.Percepcao.text == "Iniciativa" or
                                self.Percepcao.text == "Aparar" or
                                self.Percepcao.text == "Fortitude" or
                                self.Percepcao.text == "Reflexo" or
                                self.Percepcao.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.PERC_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.Percepcao.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event26 = obj.rectangle32:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.Persuacao.text == "Acrobacia" or
                                self.Persuacao.text == "Atletismo" or
                                self.Persuacao.text == "Corpo-a-Corpo" or
                                self.Persuacao.text == "Furtividade" or
                                self.Persuacao.text == "Prestidigitação" or
                                self.Persuacao.text == "Veiculos Mágicos" or
                                self.Persuacao.text == "Iniciativa" or
                                self.Persuacao.text == "Aparar" or
                                self.Persuacao.text == "Fortitude" or
                                self.Persuacao.text == "Reflexo" or
                                self.Persuacao.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.PERS_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.Persuacao.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event27 = obj.rectangle33:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.Tratamento.text == "Acrobacia" or
                                self.Tratamento.text == "Atletismo" or
                                self.Tratamento.text == "Corpo-a-Corpo" or
                                self.Tratamento.text == "Furtividade" or
                                self.Tratamento.text == "Prestidigitação" or
                                self.Tratamento.text == "Veiculos Mágicos" or
                                self.Tratamento.text == "Iniciativa" or
                                self.Tratamento.text == "Aparar" or
                                self.Tratamento.text == "Fortitude" or
                                self.Tratamento.text == "Reflexo" or
                                self.Tratamento.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.TRA_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.Tratamento.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event28 = obj.rectangle34:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.Atualidades.text == "Acrobacia" or
                                self.Atualidades.text == "Atletismo" or
                                self.Atualidades.text == "Corpo-a-Corpo" or
                                self.Atualidades.text == "Furtividade" or
                                self.Atualidades.text == "Prestidigitação" or
                                self.Atualidades.text == "Veiculos Mágicos" or
                                self.Atualidades.text == "Iniciativa" or
                                self.Atualidades.text == "Aparar" or
                                self.Atualidades.text == "Fortitude" or
                                self.Atualidades.text == "Reflexo" or
                                self.Atualidades.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.ATU_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.Atualidades.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event29 = obj.rectangle35:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.Adivinhacao.text == "Acrobacia" or
                                self.Adivinhacao.text == "Atletismo" or
                                self.Adivinhacao.text == "Corpo-a-Corpo" or
                                self.Adivinhacao.text == "Furtividade" or
                                self.Adivinhacao.text == "Prestidigitação" or
                                self.Adivinhacao.text == "Veiculos Mágicos" or
                                self.Adivinhacao.text == "Iniciativa" or
                                self.Adivinhacao.text == "Aparar" or
                                self.Adivinhacao.text == "Fortitude" or
                                self.Adivinhacao.text == "Reflexo" or
                                self.Adivinhacao.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.C_ADI_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.Adivinhacao.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event30 = obj.rectangle36:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.Azaracao.text == "Acrobacia" or
                                self.Azaracao.text == "Atletismo" or
                                self.Azaracao.text == "Corpo-a-Corpo" or
                                self.Azaracao.text == "Furtividade" or
                                self.Azaracao.text == "Prestidigitação" or
                                self.Azaracao.text == "Veiculos Mágicos" or
                                self.Azaracao.text == "Iniciativa" or
                                self.Azaracao.text == "Aparar" or
                                self.Azaracao.text == "Fortitude" or
                                self.Azaracao.text == "Reflexo" or
                                self.Azaracao.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.C_AZA_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.Azaracao.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event31 = obj.rectangle37:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.ContraFeitico.text == "Acrobacia" or
                                self.ContraFeitico.text == "Atletismo" or
                                self.ContraFeitico.text == "Corpo-a-Corpo" or
                                self.ContraFeitico.text == "Furtividade" or
                                self.ContraFeitico.text == "Prestidigitação" or
                                self.ContraFeitico.text == "Veiculos Mágicos" or
                                self.ContraFeitico.text == "Iniciativa" or
                                self.ContraFeitico.text == "Aparar" or
                                self.ContraFeitico.text == "Fortitude" or
                                self.ContraFeitico.text == "Reflexo" or
                                self.ContraFeitico.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.C_CON_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.ContraFeitico.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event32 = obj.rectangle38:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.CriaturasMagicas.text == "Acrobacia" or
                                self.CriaturasMagicas.text == "Atletismo" or
                                self.CriaturasMagicas.text == "Corpo-a-Corpo" or
                                self.CriaturasMagicas.text == "Furtividade" or
                                self.CriaturasMagicas.text == "Prestidigitação" or
                                self.CriaturasMagicas.text == "Veiculos Mágicos" or
                                self.CriaturasMagicas.text == "Iniciativa" or
                                self.CriaturasMagicas.text == "Aparar" or
                                self.CriaturasMagicas.text == "Fortitude" or
                                self.CriaturasMagicas.text == "Reflexo" or
                                self.CriaturasMagicas.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.C_CRI_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.CriaturasMagicas.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event33 = obj.rectangle39:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.Encantamentos.text == "Acrobacia" or
                                self.Encantamentos.text == "Atletismo" or
                                self.Encantamentos.text == "Corpo-a-Corpo" or
                                self.Encantamentos.text == "Furtividade" or
                                self.Encantamentos.text == "Prestidigitação" or
                                self.Encantamentos.text == "Veiculos Mágicos" or
                                self.Encantamentos.text == "Iniciativa" or
                                self.Encantamentos.text == "Aparar" or
                                self.Encantamentos.text == "Fortitude" or
                                self.Encantamentos.text == "Reflexo" or
                                self.Encantamentos.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.C_ENC_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.Encantamentos.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event34 = obj.rectangle40:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.Feiticos.text == "Acrobacia" or
                                self.Feiticos.text == "Atletismo" or
                                self.Feiticos.text == "Corpo-a-Corpo" or
                                self.Feiticos.text == "Furtividade" or
                                self.Feiticos.text == "Prestidigitação" or
                                self.Feiticos.text == "Veiculos Mágicos" or
                                self.Feiticos.text == "Iniciativa" or
                                self.Feiticos.text == "Aparar" or
                                self.Feiticos.text == "Fortitude" or
                                self.Feiticos.text == "Reflexo" or
                                self.Feiticos.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.C_FEI_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.Feiticos.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event35 = obj.rectangle41:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.Herbologia.text == "Acrobacia" or
                                self.Herbologia.text == "Atletismo" or
                                self.Herbologia.text == "Corpo-a-Corpo" or
                                self.Herbologia.text == "Furtividade" or
                                self.Herbologia.text == "Prestidigitação" or
                                self.Herbologia.text == "Veiculos Mágicos" or
                                self.Herbologia.text == "Iniciativa" or
                                self.Herbologia.text == "Aparar" or
                                self.Herbologia.text == "Fortitude" or
                                self.Herbologia.text == "Reflexo" or
                                self.Herbologia.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.C_HER_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.Herbologia.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event36 = obj.rectangle42:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.DCAT.text == "Acrobacia" or
                                self.DCAT.text == "Atletismo" or
                                self.DCAT.text == "Corpo-a-Corpo" or
                                self.DCAT.text == "Furtividade" or
                                self.DCAT.text == "Prestidigitação" or
                                self.DCAT.text == "Veiculos Mágicos" or
                                self.DCAT.text == "Iniciativa" or
                                self.DCAT.text == "Aparar" or
                                self.DCAT.text == "Fortitude" or
                                self.DCAT.text == "Reflexo" or
                                self.DCAT.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.C_MAL_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.DCAT.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event37 = obj.rectangle43:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.Pocoes.text == "Acrobacia" or
                                self.Pocoes.text == "Atletismo" or
                                self.Pocoes.text == "Corpo-a-Corpo" or
                                self.Pocoes.text == "Furtividade" or
                                self.Pocoes.text == "Prestidigitação" or
                                self.Pocoes.text == "Veiculos Mágicos" or
                                self.Pocoes.text == "Iniciativa" or
                                self.Pocoes.text == "Aparar" or
                                self.Pocoes.text == "Fortitude" or
                                self.Pocoes.text == "Reflexo" or
                                self.Pocoes.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.C_POC_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.Pocoes.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event38 = obj.rectangle44:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.Runas.text == "Acrobacia" or
                                self.Runas.text == "Atletismo" or
                                self.Runas.text == "Corpo-a-Corpo" or
                                self.Runas.text == "Furtividade" or
                                self.Runas.text == "Prestidigitação" or
                                self.Runas.text == "Veiculos Mágicos" or
                                self.Runas.text == "Iniciativa" or
                                self.Runas.text == "Aparar" or
                                self.Runas.text == "Fortitude" or
                                self.Runas.text == "Reflexo" or
                                self.Runas.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.C_RUN_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.Runas.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event39 = obj.rectangle45:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.Transmutacao.text == "Acrobacia" or
                                self.Transmutacao.text == "Atletismo" or
                                self.Transmutacao.text == "Corpo-a-Corpo" or
                                self.Transmutacao.text == "Furtividade" or
                                self.Transmutacao.text == "Prestidigitação" or
                                self.Transmutacao.text == "Veiculos Mágicos" or
                                self.Transmutacao.text == "Iniciativa" or
                                self.Transmutacao.text == "Aparar" or
                                self.Transmutacao.text == "Fortitude" or
                                self.Transmutacao.text == "Reflexo" or
                                self.Transmutacao.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.C_TRA_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.Transmutacao.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event40 = obj.button1:addEventListener("onClick",
        function (event)
            self.outrasPericias_record:append();
        end);

    obj._e_event41 = obj.rectangle46:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.Iniciativa.text == "Acrobacia" or
                                self.Iniciativa.text == "Atletismo" or
                                self.Iniciativa.text == "Corpo-a-Corpo" or
                                self.Iniciativa.text == "Furtividade" or
                                self.Iniciativa.text == "Prestidigitação" or
                                self.Iniciativa.text == "Veiculos Mágicos" or
                                self.Iniciativa.text == "Iniciativa" or
                                self.Iniciativa.text == "Aparar" or
                                self.Iniciativa.text == "Fortitude" or
                                self.Iniciativa.text == "Reflexo" or
                                self.Iniciativa.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.INI_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.Iniciativa.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event42 = obj.rectangle47:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.Aparar.text == "Acrobacia" or
                                self.Aparar.text == "Atletismo" or
                                self.Aparar.text == "Corpo-a-Corpo" or
                                self.Aparar.text == "Furtividade" or
                                self.Aparar.text == "Prestidigitação" or
                                self.Aparar.text == "Veiculos Mágicos" or
                                self.Aparar.text == "Iniciativa" or
                                self.Aparar.text == "Aparar" or
                                self.Aparar.text == "Fortitude" or
                                self.Aparar.text == "Reflexo" or
                                self.Aparar.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.APA_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.Aparar.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event43 = obj.rectangle48:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.Fortitude.text == "Acrobacia" or
                                self.Fortitude.text == "Atletismo" or
                                self.Fortitude.text == "Corpo-a-Corpo" or
                                self.Fortitude.text == "Furtividade" or
                                self.Fortitude.text == "Prestidigitação" or
                                self.Fortitude.text == "Veiculos Mágicos" or
                                self.Fortitude.text == "Iniciativa" or
                                self.Fortitude.text == "Aparar" or
                                self.Fortitude.text == "Fortitude" or
                                self.Fortitude.text == "Reflexo" or
                                self.Fortitude.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.FORT_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.Fortitude.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event44 = obj.rectangle49:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.Reflexo.text == "Acrobacia" or
                                self.Reflexo.text == "Atletismo" or
                                self.Reflexo.text == "Corpo-a-Corpo" or
                                self.Reflexo.text == "Furtividade" or
                                self.Reflexo.text == "Prestidigitação" or
                                self.Reflexo.text == "Veiculos Mágicos" or
                                self.Reflexo.text == "Iniciativa" or
                                self.Reflexo.text == "Aparar" or
                                self.Reflexo.text == "Fortitude" or
                                self.Reflexo.text == "Reflexo" or
                                self.Reflexo.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.REF_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.Reflexo.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event45 = obj.rectangle50:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.Resistencia.text == "Acrobacia" or
                                self.Resistencia.text == "Atletismo" or
                                self.Resistencia.text == "Corpo-a-Corpo" or
                                self.Resistencia.text == "Furtividade" or
                                self.Resistencia.text == "Prestidigitação" or
                                self.Resistencia.text == "Veiculos Mágicos" or
                                self.Resistencia.text == "Iniciativa" or
                                self.Resistencia.text == "Aparar" or
                                self.Resistencia.text == "Fortitude" or
                                self.Resistencia.text == "Reflexo" or
                                self.Resistencia.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.RES_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.Resistencia.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event46 = obj.rectangle51:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.Vontade.text == "Acrobacia" or
                                self.Vontade.text == "Atletismo" or
                                self.Vontade.text == "Corpo-a-Corpo" or
                                self.Vontade.text == "Furtividade" or
                                self.Vontade.text == "Prestidigitação" or
                                self.Vontade.text == "Veiculos Mágicos" or
                                self.Vontade.text == "Iniciativa" or
                                self.Vontade.text == "Aparar" or
                                self.Vontade.text == "Fortitude" or
                                self.Vontade.text == "Reflexo" or
                                self.Vontade.text == "Resistencia" then
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                else
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.VON_Total or 0) .. (condition()
                                and (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.Vontade.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event47 = obj.button2:addEventListener("onClick",
        function (event)
            treinar()
        end);

    obj._e_event48 = obj.button3:addEventListener("onClick",
        function (event)
            self.kekzin:append();
        end);

    obj._e_event49 = obj.rectangle56:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.ANTE_QUAD.text == "Antecipar" or
                                self.ANTE_QUAD.text == "Atrapalhar" or
                                self.ANTE_QUAD.text == "Marcar Falta" then
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                else
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.ANTE_QUAD_TOTAL or 0) .. (condition() and
                                (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.ANTE_QUAD.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event50 = obj.rectangle57:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.APAN_QUAD.text == "Antecipar" or
                                self.APAN_QUAD.text == "Atrapalhar" or
                                self.APAN_QUAD.text == "Marcar Falta" then
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                else
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.APAN_QUAD_TOTAL or 0) .. (condition() and
                                (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.APAN_QUAD.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event51 = obj.rectangle58:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.ATRA_QUAD.text == "Antecipar" or
                                self.ATRA_QUAD.text == "Atrapalhar" or
                                self.ATRA_QUAD.text == "Marcar Falta" then
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                else
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.ATRA_QUAD_TOTAL or 0) .. (condition() and
                                (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.ATRA_QUAD.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event52 = obj.rectangle59:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.DEFE_QUAD.text == "Antecipar" or
                                self.DEFE_QUAD.text == "Atrapalhar" or
                                self.DEFE_QUAD.text == "Marcar Falta" then
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                else
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.DEFE_QUAD_TOTAL or 0) .. (condition() and
                                (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.DEFE_QUAD.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event53 = obj.rectangle60:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.DRI_QUAD.text == "Antecipar" or
                                self.DRI_QUAD.text == "Atrapalhar" or
                                self.DRI_QUAD.text == "Marcar Falta" then
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                else
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.DRI_QUAD_TOTAL or 0) .. (condition() and
                                (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.DRI_QUAD.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event54 = obj.rectangle61:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.GOL_QUAD.text == "Antecipar" or
                                self.GOL_QUAD.text == "Atrapalhar" or
                                self.GOL_QUAD.text == "Marcar Falta" then
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                else
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.GOL_QUAD_TOTAL or 0) .. (condition() and
                                (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.GOL_QUAD.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event55 = obj.rectangle62:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.FALTA_QUAD.text == "Antecipar" or
                                self.FALTA_QUAD.text == "Atrapalhar" or
                                self.FALTA_QUAD.text == "Marcar Falta" then
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                else
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.FALTA_QUAD_TOTAL or 0) .. (condition() and
                                (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.FALTA_QUAD.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event56 = obj.rectangle63:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.PASS_QUAD.text == "Antecipar" or
                                self.PASS_QUAD.text == "Atrapalhar" or
                                self.PASS_QUAD.text == "Marcar Falta" then
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                else
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.PASS_QUAD_TOTAL or 0) .. (condition() and
                                (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.PASS_QUAD.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event57 = obj.rectangle64:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.REBA_QUAD.text == "Antecipar" or
                                self.REBA_QUAD.text == "Atrapalhar" or
                                self.REBA_QUAD.text == "Marcar Falta" then
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                else
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.REBA_QUAD_TOTAL or 0) .. (condition() and
                                (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.REBA_QUAD.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event58 = obj.rectangle65:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.ROU_QUAD.text == "Antecipar" or
                                self.ROU_QUAD.text == "Atrapalhar" or
                                self.ROU_QUAD.text == "Marcar Falta" then
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                else
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.ROU_QUAD_TOTAL or 0) .. (condition() and
                                (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.ROU_QUAD.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event59 = obj.rectangle66:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                                local chat = mesaDoPersonagem.chat
                                local nodeMain = NDB.getRoot(sheet)
            
                                local function condition()
            
                                if self.VEL_QUAD.text == "Antecipar" or
                                self.VEL_QUAD.text == "Atrapalhar" or
                                self.VEL_QUAD.text == "Marcar Falta" then
            
                                if sheet.Tiltado then
                                return -5
                                end
            
                                if sheet.Frustrado then
                                return -2
                                end
            
                                else
            
                                if sheet.Exausto then
                                return -5
                                end
            
                                if sheet.Fadigado then
                                return -2
                                end
            
                                end
            
                                return nil
                                end
            
                                chat:rolarDados("1d20 + " .. (sheet.VEL_QUAD_TOTAL or 0) .. (condition() and
                                (condition()) or ""),
                                (nodeMain.nomePersonagem and nodeMain.nomePersonagem .. " - " or "") .. self.VEL_QUAD.text,
                                function (rolado)
            
                                end);
        end);

    obj._e_event60 = obj.edit157:addEventListener("onUserChange",
        function ()
        end);

    obj._e_event61 = obj.edit158:addEventListener("onUserChange",
        function ()
        end);

    obj._e_event62 = obj.edit159:addEventListener("onUserChange",
        function ()
        end);

    obj._e_event63 = obj.edit160:addEventListener("onUserChange",
        function ()
        end);

    obj._e_event64 = obj.edit161:addEventListener("onUserChange",
        function ()
        end);

    obj._e_event65 = obj.edit162:addEventListener("onUserChange",
        function ()
        end);

    obj._e_event66 = obj.edit163:addEventListener("onUserChange",
        function ()
        end);

    obj._e_event67 = obj.edit164:addEventListener("onUserChange",
        function ()
        end);

    obj._e_event68 = obj.dataLink2:addEventListener("onChange",
        function (field, oldValue, newValue)
            -- CUIDADO COM A ORGANIZAÇÃO DESSE CODIGO COM XML PODE DAR ERRO
            
                        local minhaMesa = Firecast.getRoomOf(sheet);
                        local chat = minhaMesa.chat;
            
                        if oldValue == nil then
                        return
                        end
            
                        local novoValor = math.abs(newValue or 0)
                        local antigoValor = math.abs(oldValue or 0)
            
                        chat:enviarAcao("Estava com penalidade de Fisica de " .. antigoValor ..
                        " e agora esta com " .. novoValor)
            
                        sheet.fisico = novoValor
        end);

    obj._e_event69 = obj.dataLink3:addEventListener("onChange",
        function (field, oldValue, newValue)
            -- CUIDADO COM A ORGANIZAÇÃO DESSE CODIGO COM XML PODE DAR ERRO
            
                        local minhaMesa = Firecast.getRoomOf(sheet);
                        local chat = minhaMesa.chat;
            
                        if oldValue == nil then
                        return
                        end
            
                        local novoValor = math.abs(newValue or 0)
                        local antigoValor = math.abs(oldValue or 0)
            
                        chat:enviarAcao("Estava com penalidade de Mente de " .. antigoValor ..
                        " e agora esta com " .. novoValor)
            
                        sheet.mental = novoValor
        end);

    obj._e_event70 = obj.edit167:addEventListener("onUserChange",
        function ()
        end);

    obj._e_event71 = obj.edit168:addEventListener("onUserChange",
        function ()
        end);

    obj._e_event72 = obj.button4:addEventListener("onClick",
        function (event)
            adicionarFeitico()
        end);

    obj._e_event73 = obj.button5:addEventListener("onClick",
        function (event)
            self.rclMagias:sort();
        end);

    obj._e_event74 = obj.button6:addEventListener("onClick",
        function (event)
            Dialogs.showMessageDlg("Deseja Atualizar sua Lista de Feitiços ?",
                        dialogs.DT_INFORMATION,
                        {dialogs.DB_YES, dialogs.DB_NO}, function (escolha)
            
                        if escolha == dialogs.DB_YES then
            
                        local Raiz = NDB.load("listfetico.xml");
                        local baseDeFeiticos = NDB.getChildNodes(Raiz);
                        local feiticosCadastrados = NDB.getChildNodes(sheet.magias)
                        local falhas = ""
            
                        ListaFeiticos = {} -- new array
                        ListaNomesFeitico = {} -- new array
            
                        for i = 1, #baseDeFeiticos, 1 do
                        ListaFeiticos[i] = Raiz["f" .. i]
                        ListaNomesFeitico[i] = Raiz["f" .. i].nome
                        table.sort(ListaNomesFeitico)
                        end
            
                        for k = 1, #feiticosCadastrados, 1 do
            
                        local falha = true
            
                        for i = 1, #ListaFeiticos , 1 do
            
                        if feiticosCadastrados[k].nome == ListaFeiticos[i].nome then
            
                        falha = false
            
                        self.rclMagias.selectedNode = feiticosCadastrados[k]
                        local node = self.rclMagias.selectedNode;
                        self.boxDetalhesDoItem.node = node;
                        self.boxDetalhesDoItem.visible = (node ~= nil);
            
                        feiticosCadastrados[k].escola = ListaFeiticos[i].escola
                        feiticosCadastrados[k].tipo = ListaFeiticos[i].cast
                        feiticosCadastrados[k].Desc = ListaFeiticos[i].Desc
                        feiticosCadastrados[k].Efeito = ListaFeiticos[i].Efeito
                        feiticosCadastrados[k].Bonus = ListaFeiticos[i].Bonus
                        feiticosCadastrados[k].defesa = ListaFeiticos[i].defesa
            
                        feiticosCadastrados[k].CD = totable(ListaFeiticos[i].cdfArray)[node.CD_grad]
                        feiticosCadastrados[k].CD_array = ListaFeiticos[i].cdfArray
                        feiticosCadastrados[k].Dano = totable(ListaFeiticos[i].danoArray)[node.Dano_grad]
                        feiticosCadastrados[k].Dano_array = ListaFeiticos[i].danoArray
                        feiticosCadastrados[k].Poder = totable(ListaFeiticos[i].poderArray)[node.Poder_grad]
                        feiticosCadastrados[k].Poder_array = ListaFeiticos[i].poderArray
                        feiticosCadastrados[k].Range = totable(ListaFeiticos[i].rangeArray)[node.Range_grad]
                        feiticosCadastrados[k].Range_array = ListaFeiticos[i].rangeArray
                        feiticosCadastrados[k].Area = totable(ListaFeiticos[i].areaArray)[node.Area_grad]
                        feiticosCadastrados[k].Area_array = ListaFeiticos[i].areaArray
                        feiticosCadastrados[k].Duracao =
                        totable(ListaFeiticos[i].duracaoArray)[node.Duracao_grad]
            
                        node.Duracao_array = ListaFeiticos[i].duracaoArray
                        node.escola = ListaFeiticos[i].escola
                        node.tipo = ListaFeiticos[i].cast
                        node.Desc = ListaFeiticos[i].Desc
                        node.Efeito = ListaFeiticos[i].Efeito
                        node.Bonus = ListaFeiticos[i].Bonus
                        node.defesa = ListaFeiticos[i].defesa
            
                        node.CD = totable(ListaFeiticos[i].cdfArray)[node.CD_grad]
                        node.CD_array = ListaFeiticos[i].cdfArray
                        node.Dano = totable(ListaFeiticos[i].danoArray)[node.Dano_grad]
                        node.Dano_array = ListaFeiticos[i].danoArray
                        node.Poder = totable(ListaFeiticos[i].poderArray)[node.Poder_grad]
                        node.Poder_array = ListaFeiticos[i].poderArray
                        node.Range = totable(ListaFeiticos[i].rangeArray)[node.Range_grad]
                        node.Range_array = ListaFeiticos[i].rangeArray
                        node.Area = totable(ListaFeiticos[i].areaArray)[node.Area_grad]
                        node.Area_array = ListaFeiticos[i].areaArray
                        node.Duracao =
                        totable(ListaFeiticos[i].duracaoArray)[node.Duracao_grad]
                        node.Duracao_array = ListaFeiticos[i].duracaoArray
            
                        end
            
                        end
            
                        if falha == true then
            
                        falhas = falhas .. feiticosCadastrados[k].nome .. "\n"
            
                        end
                        end
            
                        if falhas ~= "" then
                        showMessage("Falha em Atualizar os Feitiços: \n\n "
                        .. falhas ..
                        "\n\n O Nome do Feitiço deve ser Igual para atualiza-lo" ..
                        " Ou Anote seus valores e importe o Feitiço novamente")
                        else
                        showMessage("Todos os Feitiços foram atualizados!")
                        end
            
                        elseif escolha == dialogs.DB_NO then
                        showMessage("Se não atualizar vai perder ponto")
                        -- usuário escolheu IGNORE
                        end;
                        end);
        end);

    obj._e_event75 = obj.rclMagias:addEventListener("onSelect",
        function ()
            local node = self.rclMagias.selectedNode;
            
                          if node == nil then
                            return
                          end
                          
                          self.boxDetalhesDoItem.node = node; 
                          self.boxDetalhesDoItem.visible = (node ~= nil);
            
                          if node.CD_grad then
            
                            local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) +
                            (node.Dano_grad - 1) + (node.Range_grad - 1) + (node.Area_grad - 1) +
                            (node.Duracao_grad - 1)) 
            
                            if node.Grad == tonumber(graduacoes) then
                                          self.rectangle.color = "gray"
                              elseif node.Grad > tonumber(graduacoes) then
                                  self.rectangle.color = "green"
                              elseif node.Grad < tonumber(graduacoes) then
                                  self.rectangle.color = "red"
                              end
            
                          end
        end);

    obj._e_event76 = obj.rclMagias:addEventListener("onCompare",
        function (nodeA, nodeB)
            if (tonumber(nodeA.Order) or 0) < (tonumber(nodeB.Order) or 0) then
                                             return -1;
                                       elseif (tonumber(nodeA.Order) or 0) > (tonumber(nodeB.Order) or 0) then
                                             return 1;
                                       else   
                                             return Utils.compareStringPtBr(nodeA.nome, nodeB.nome);
                                       end;
        end);

    obj._e_event77 = obj.rclMagias:addEventListener("onEndEnumeration",
        function ()
            if self.rclMagias.selectedNode == nil and sheet ~= nil then
                          local nodes = ndb.getChildNodes(sheet.magias);
            
                          if #nodes > 0 then
                          self.rclMagias.selectedNode = nodes[1];
                          end;
                          end;
        end);

    obj._e_event78 = obj.escola:addEventListener("onChange",
        function ()
            local dataScope = self.boxDetalhesDoItem.node
            
                              if dataScope then
                              if dataScope.escola == "Contra-Feitiço" then
                              self.escola.fontColor = "#EABFCB"
                              elseif dataScope.escola == "Encantamento" then
                              self.escola.fontColor = "#2BD9FE"
                              elseif dataScope.escola == "Feitiço" then
                              self.escola.fontColor = "#7765E3"
                              elseif dataScope.escola == "Azaração" then
                              self.escola.fontColor = "#A1683A"
                              elseif dataScope.escola == "Transmutação" then
                              self.escola.fontColor = "#E4572E"
                              elseif dataScope.escola == "Maldição" then
                              self.escola.fontColor = "#32936F"
                              elseif dataScope.escola == "Adivinhação" then
                              self.escola.fontColor = "#BCCCE0"
                              end
                              end
        end);

    obj._e_event79 = obj.tipo:addEventListener("onChange",
        function ()
            local dataScope = self.boxDetalhesDoItem.node
            
                              if dataScope then
                              if dataScope.tipo == "Ataque" then
                              self.tipo.fontColor = "#FF0022"
                              elseif dataScope.tipo == "Ataque Base" then
                              self.tipo.fontColor = "#F22"
                              elseif dataScope.tipo == "Defesa" then
                              self.tipo.fontColor = "#53FF45"
                              elseif dataScope.tipo == "Cast" then
                              self.tipo.fontColor = "#E8C547"
                              end
                              end
        end);

    obj._e_event80 = obj.edit171:addEventListener("onChange",
        function ()
        end);

    obj._e_event81 = obj.Grad:addEventListener("onMouseEnter",
        function ()
            self.Grad.hint = sheet.Grad
        end);

    obj._e_event82 = obj.button7:addEventListener("onClick",
        function (event)
            local node = self.rclMagias.selectedNode;
                                    local array = totable(node.Grad_array)
                                    local grad = tonumber(node.Grad_grad)
                                    local result = grad
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                    (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if (grad - 1) == graduacoes then
                                        if node.Grad_name == "Grad" then
                                        return
                                        end
                                    end
            
                                        if grad > 1 then
            
                                            result = result - 1
                                            sheet.Grad_grad = result
                                            sheet.Grad = array[result]
                                            node.Grad_grad = result
                                            node.Grad = array[result]
                                        
                                        end
                                    
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                            (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if node.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif node.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    end
        end);

    obj._e_event83 = obj.button8:addEventListener("onClick",
        function (event)
            local node = self.rclMagias.selectedNode;
                                    local array = totable(node.Grad_array)
                                    local grad = tonumber(node.Grad_grad)
                                    local result = grad
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                    (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if node.Grad > graduacoes then
            
                                        if grad < #array then
            
                                            result = result + 1
                                            sheet.Grad_grad = result
                                            sheet.Grad = array[result]
                                            node.Grad_grad = result
                                            node.Grad = array[result]
            
                                        
                                        end
            
                                    else 
                                    
                                    if sheet.Grad_name == "Grad" then
            
                                        result = result + 1
                                        sheet.Grad_grad = result
                                        sheet.Grad = array[result]
                                        node.Grad_grad = result
                                        node.Grad = array[result]
            
                                    end
                                    
            
                                    end
            
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                            (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if node.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif node.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    elseif node.Grad < tonumber(graduacoes) then
                                        self.rectangle.color = "red"
                                    end
        end);

    obj._e_event84 = obj.edit174:addEventListener("onChange",
        function ()
        end);

    obj._e_event85 = obj.CD:addEventListener("onMouseEnter",
        function ()
            self.CD.hint = sheet.CD
        end);

    obj._e_event86 = obj.button9:addEventListener("onClick",
        function (event)
            local node = self.rclMagias.selectedNode;
                                    local array = totable(node.CD_array)
                                    local grad = tonumber(node.CD_grad)
                                    local result = grad
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                    (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if (grad - 1) == graduacoes then
                                        if node.CD_name == "Grad" then
                                        return
                                        end
                                    end
            
                                        if grad > 1 then
            
                                            result = result - 1
                                            sheet.CD_grad = result
                                            sheet.CD = array[result]
                                            node.CD_grad = result
                                            node.CD = array[result]
                                        
                                        end
                                    
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                            (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if node.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif node.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    end
        end);

    obj._e_event87 = obj.button10:addEventListener("onClick",
        function (event)
            local node = self.rclMagias.selectedNode;
                                    local array = totable(node.CD_array)
                                    local grad = tonumber(node.CD_grad)
                                    local result = grad
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                    (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if node.Grad > graduacoes then
            
                                        if grad < #array then
            
                                            result = result + 1
                                            sheet.CD_grad = result
                                            sheet.CD = array[result]
                                            node.CD_grad = result
                                            node.CD = array[result]
            
                                        
                                        end
            
                                    else 
                                    
                                    if sheet.CD_name == "Grad" then
            
                                        result = result + 1
                                        sheet.CD_grad = result
                                        sheet.CD = array[result]
                                        node.CD_grad = result
                                        node.CD = array[result]
            
                                    end
                                    
            
                                    end
            
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                            (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if node.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif node.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    elseif node.Grad < tonumber(graduacoes) then
                                        self.rectangle.color = "red"
                                    end
        end);

    obj._e_event88 = obj.edit177:addEventListener("onChange",
        function ()
        end);

    obj._e_event89 = obj.Efeito:addEventListener("onMouseEnter",
        function ()
            self.Efeito.hint = sheet.Efeito
        end);

    obj._e_event90 = obj.button11:addEventListener("onClick",
        function (event)
            local node = self.rclMagias.selectedNode;
                                    local array = totable(node.Efeito_array)
                                    local grad = tonumber(node.Efeito_grad)
                                    local result = grad
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                    (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if (grad - 1) == graduacoes then
                                        if node.Efeito_name == "Grad" then
                                        return
                                        end
                                    end
            
                                        if grad > 1 then
            
                                            result = result - 1
                                            sheet.Efeito_grad = result
                                            sheet.Efeito = array[result]
                                            node.Efeito_grad = result
                                            node.Efeito = array[result]
                                        
                                        end
                                    
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                            (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if node.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif node.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    end
        end);

    obj._e_event91 = obj.button12:addEventListener("onClick",
        function (event)
            local node = self.rclMagias.selectedNode;
                                    local array = totable(node.Efeito_array)
                                    local grad = tonumber(node.Efeito_grad)
                                    local result = grad
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                    (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if node.Grad > graduacoes then
            
                                        if grad < #array then
            
                                            result = result + 1
                                            sheet.Efeito_grad = result
                                            sheet.Efeito = array[result]
                                            node.Efeito_grad = result
                                            node.Efeito = array[result]
            
                                        
                                        end
            
                                    else 
                                    
                                    if sheet.Efeito_name == "Grad" then
            
                                        result = result + 1
                                        sheet.Efeito_grad = result
                                        sheet.Efeito = array[result]
                                        node.Efeito_grad = result
                                        node.Efeito = array[result]
            
                                    end
                                    
            
                                    end
            
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                            (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if node.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif node.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    elseif node.Grad < tonumber(graduacoes) then
                                        self.rectangle.color = "red"
                                    end
        end);

    obj._e_event92 = obj.edit180:addEventListener("onChange",
        function ()
        end);

    obj._e_event93 = obj.Poder:addEventListener("onMouseEnter",
        function ()
            self.Poder.hint = sheet.Poder
        end);

    obj._e_event94 = obj.button13:addEventListener("onClick",
        function (event)
            local node = self.rclMagias.selectedNode;
                                    local array = totable(node.Poder_array)
                                    local grad = tonumber(node.Poder_grad)
                                    local result = grad
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                    (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if (grad - 1) == graduacoes then
                                        if node.Poder_name == "Grad" then
                                        return
                                        end
                                    end
            
                                        if grad > 1 then
            
                                            result = result - 1
                                            sheet.Poder_grad = result
                                            sheet.Poder = array[result]
                                            node.Poder_grad = result
                                            node.Poder = array[result]
                                        
                                        end
                                    
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                            (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if node.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif node.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    end
        end);

    obj._e_event95 = obj.button14:addEventListener("onClick",
        function (event)
            local node = self.rclMagias.selectedNode;
                                    local array = totable(node.Poder_array)
                                    local grad = tonumber(node.Poder_grad)
                                    local result = grad
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                    (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if node.Grad > graduacoes then
            
                                        if grad < #array then
            
                                            result = result + 1
                                            sheet.Poder_grad = result
                                            sheet.Poder = array[result]
                                            node.Poder_grad = result
                                            node.Poder = array[result]
            
                                        
                                        end
            
                                    else 
                                    
                                    if sheet.Poder_name == "Grad" then
            
                                        result = result + 1
                                        sheet.Poder_grad = result
                                        sheet.Poder = array[result]
                                        node.Poder_grad = result
                                        node.Poder = array[result]
            
                                    end
                                    
            
                                    end
            
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                            (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if node.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif node.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    elseif node.Grad < tonumber(graduacoes) then
                                        self.rectangle.color = "red"
                                    end
        end);

    obj._e_event96 = obj.edit183:addEventListener("onChange",
        function ()
        end);

    obj._e_event97 = obj.Dano:addEventListener("onMouseEnter",
        function ()
            self.Dano.hint = sheet.Dano
        end);

    obj._e_event98 = obj.button15:addEventListener("onClick",
        function (event)
            local node = self.rclMagias.selectedNode;
                                    local array = totable(node.Dano_array)
                                    local grad = tonumber(node.Dano_grad)
                                    local result = grad
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                    (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if (grad - 1) == graduacoes then
                                        if node.Dano_name == "Grad" then
                                        return
                                        end
                                    end
            
                                        if grad > 1 then
            
                                            result = result - 1
                                            sheet.Dano_grad = result
                                            sheet.Dano = array[result]
                                            node.Dano_grad = result
                                            node.Dano = array[result]
                                        
                                        end
                                    
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                            (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if node.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif node.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    end
        end);

    obj._e_event99 = obj.button16:addEventListener("onClick",
        function (event)
            local node = self.rclMagias.selectedNode;
                                    local array = totable(node.Dano_array)
                                    local grad = tonumber(node.Dano_grad)
                                    local result = grad
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                    (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if node.Grad > graduacoes then
            
                                        if grad < #array then
            
                                            result = result + 1
                                            sheet.Dano_grad = result
                                            sheet.Dano = array[result]
                                            node.Dano_grad = result
                                            node.Dano = array[result]
            
                                        
                                        end
            
                                    else 
                                    
                                    if sheet.Dano_name == "Grad" then
            
                                        result = result + 1
                                        sheet.Dano_grad = result
                                        sheet.Dano = array[result]
                                        node.Dano_grad = result
                                        node.Dano = array[result]
            
                                    end
                                    
            
                                    end
            
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                            (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if node.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif node.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    elseif node.Grad < tonumber(graduacoes) then
                                        self.rectangle.color = "red"
                                    end
        end);

    obj._e_event100 = obj.edit186:addEventListener("onChange",
        function ()
        end);

    obj._e_event101 = obj.Bonus:addEventListener("onMouseEnter",
        function ()
            self.Bonus.hint = sheet.Bonus
        end);

    obj._e_event102 = obj.button17:addEventListener("onClick",
        function (event)
            local node = self.rclMagias.selectedNode;
                                    local array = totable(node.Bonus_array)
                                    local grad = tonumber(node.Bonus_grad)
                                    local result = grad
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                    (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if (grad - 1) == graduacoes then
                                        if node.Bonus_name == "Grad" then
                                        return
                                        end
                                    end
            
                                        if grad > 1 then
            
                                            result = result - 1
                                            sheet.Bonus_grad = result
                                            sheet.Bonus = array[result]
                                            node.Bonus_grad = result
                                            node.Bonus = array[result]
                                        
                                        end
                                    
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                            (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if node.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif node.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    end
        end);

    obj._e_event103 = obj.button18:addEventListener("onClick",
        function (event)
            local node = self.rclMagias.selectedNode;
                                    local array = totable(node.Bonus_array)
                                    local grad = tonumber(node.Bonus_grad)
                                    local result = grad
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                    (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if node.Grad > graduacoes then
            
                                        if grad < #array then
            
                                            result = result + 1
                                            sheet.Bonus_grad = result
                                            sheet.Bonus = array[result]
                                            node.Bonus_grad = result
                                            node.Bonus = array[result]
            
                                        
                                        end
            
                                    else 
                                    
                                    if sheet.Bonus_name == "Grad" then
            
                                        result = result + 1
                                        sheet.Bonus_grad = result
                                        sheet.Bonus = array[result]
                                        node.Bonus_grad = result
                                        node.Bonus = array[result]
            
                                    end
                                    
            
                                    end
            
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                            (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if node.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif node.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    elseif node.Grad < tonumber(graduacoes) then
                                        self.rectangle.color = "red"
                                    end
        end);

    obj._e_event104 = obj.edit189:addEventListener("onChange",
        function ()
        end);

    obj._e_event105 = obj.Range:addEventListener("onMouseEnter",
        function ()
            self.Range.hint = sheet.Range
        end);

    obj._e_event106 = obj.button19:addEventListener("onClick",
        function (event)
            local node = self.rclMagias.selectedNode;
                                    local array = totable(node.Range_array)
                                    local grad = tonumber(node.Range_grad)
                                    local result = grad
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                    (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if (grad - 1) == graduacoes then
                                        if node.Range_name == "Grad" then
                                        return
                                        end
                                    end
            
                                        if grad > 1 then
            
                                            result = result - 1
                                            sheet.Range_grad = result
                                            sheet.Range = array[result]
                                            node.Range_grad = result
                                            node.Range = array[result]
                                        
                                        end
                                    
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                            (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if node.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif node.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    end
        end);

    obj._e_event107 = obj.button20:addEventListener("onClick",
        function (event)
            local node = self.rclMagias.selectedNode;
                                    local array = totable(node.Range_array)
                                    local grad = tonumber(node.Range_grad)
                                    local result = grad
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                    (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if node.Grad > graduacoes then
            
                                        if grad < #array then
            
                                            result = result + 1
                                            sheet.Range_grad = result
                                            sheet.Range = array[result]
                                            node.Range_grad = result
                                            node.Range = array[result]
            
                                        
                                        end
            
                                    else 
                                    
                                    if sheet.Range_name == "Grad" then
            
                                        result = result + 1
                                        sheet.Range_grad = result
                                        sheet.Range = array[result]
                                        node.Range_grad = result
                                        node.Range = array[result]
            
                                    end
                                    
            
                                    end
            
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                            (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if node.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif node.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    elseif node.Grad < tonumber(graduacoes) then
                                        self.rectangle.color = "red"
                                    end
        end);

    obj._e_event108 = obj.edit192:addEventListener("onChange",
        function ()
        end);

    obj._e_event109 = obj.Area:addEventListener("onMouseEnter",
        function ()
            self.Area.hint = sheet.Area
        end);

    obj._e_event110 = obj.button21:addEventListener("onClick",
        function (event)
            local node = self.rclMagias.selectedNode;
                                    local array = totable(node.Area_array)
                                    local grad = tonumber(node.Area_grad)
                                    local result = grad
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                    (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if (grad - 1) == graduacoes then
                                        if node.Area_name == "Grad" then
                                        return
                                        end
                                    end
            
                                        if grad > 1 then
            
                                            result = result - 1
                                            sheet.Area_grad = result
                                            sheet.Area = array[result]
                                            node.Area_grad = result
                                            node.Area = array[result]
                                        
                                        end
                                    
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                            (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if node.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif node.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    end
        end);

    obj._e_event111 = obj.button22:addEventListener("onClick",
        function (event)
            local node = self.rclMagias.selectedNode;
                                    local array = totable(node.Area_array)
                                    local grad = tonumber(node.Area_grad)
                                    local result = grad
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                    (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if node.Grad > graduacoes then
            
                                        if grad < #array then
            
                                            result = result + 1
                                            sheet.Area_grad = result
                                            sheet.Area = array[result]
                                            node.Area_grad = result
                                            node.Area = array[result]
            
                                        
                                        end
            
                                    else 
                                    
                                    if sheet.Area_name == "Grad" then
            
                                        result = result + 1
                                        sheet.Area_grad = result
                                        sheet.Area = array[result]
                                        node.Area_grad = result
                                        node.Area = array[result]
            
                                    end
                                    
            
                                    end
            
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                            (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if node.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif node.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    elseif node.Grad < tonumber(graduacoes) then
                                        self.rectangle.color = "red"
                                    end
        end);

    obj._e_event112 = obj.edit195:addEventListener("onChange",
        function ()
        end);

    obj._e_event113 = obj.Duracao:addEventListener("onMouseEnter",
        function ()
            self.Duracao.hint = sheet.Duracao
        end);

    obj._e_event114 = obj.button23:addEventListener("onClick",
        function (event)
            local node = self.rclMagias.selectedNode;
                                    local array = totable(node.Duracao_array)
                                    local grad = tonumber(node.Duracao_grad)
                                    local result = grad
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                    (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if (grad - 1) == graduacoes then
                                        if node.Duracao_name == "Grad" then
                                        return
                                        end
                                    end
            
                                        if grad > 1 then
            
                                            result = result - 1
                                            sheet.Duracao_grad = result
                                            sheet.Duracao = array[result]
                                            node.Duracao_grad = result
                                            node.Duracao = array[result]
                                        
                                        end
                                    
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                            (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if node.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif node.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    end
        end);

    obj._e_event115 = obj.button24:addEventListener("onClick",
        function (event)
            local node = self.rclMagias.selectedNode;
                                    local array = totable(node.Duracao_array)
                                    local grad = tonumber(node.Duracao_grad)
                                    local result = grad
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                    (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if node.Grad > graduacoes then
            
                                        if grad < #array then
            
                                            result = result + 1
                                            sheet.Duracao_grad = result
                                            sheet.Duracao = array[result]
                                            node.Duracao_grad = result
                                            node.Duracao = array[result]
            
                                        
                                        end
            
                                    else 
                                    
                                    if sheet.Duracao_name == "Grad" then
            
                                        result = result + 1
                                        sheet.Duracao_grad = result
                                        sheet.Duracao = array[result]
                                        node.Duracao_grad = result
                                        node.Duracao = array[result]
            
                                    end
                                    
            
                                    end
            
                                    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1 ) + (node.Dano_grad - 1) + (node.Range_grad - 1) + 
                                            (node.Area_grad - 1) + (node.Duracao_grad - 1))
            
                                    if node.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif node.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    elseif node.Grad < tonumber(graduacoes) then
                                        self.rectangle.color = "red"
                                    end
        end);

    obj._e_event116 = obj.button25:addEventListener("onClick",
        function (event)
            rolarFeitico()
        end);

    obj._e_event117 = obj.button26:addEventListener("onClick",
        function (event)
            ListaDeFeitico()
        end);

    obj._e_event118 = obj.button27:addEventListener("onClick",
        function (event)
            Aceitar()
        end);

    obj._e_event119 = obj.button28:addEventListener("onClick",
        function (event)
            abrirPopUp()
        end);

    obj._e_event120 = obj.rectangle94:addEventListener("onDblClick",
        function (event)
            local minhaMesa = Firecast.getRoomOf(sheet);
                              local chat = minhaMesa.chat;
                              local node = self.rclMagias.selectedNode;
                              Dialogs.showMessageDlg("Deseja Enviar na mesa ?",
                              dialogs.DT_INFORMATION,
                              {dialogs.DB_YES, dialogs.DB_NO}, function (escolha)
            
                              if escolha == dialogs.DB_YES then
                              chat:enviarMensagem("Descrição do " .. node.nome .. ":\n" .. node.Desc)
                              end
            
                              end)
        end);

    obj._e_event121 = obj.rectangle96:addEventListener("onDblClick",
        function (event)
            local minhaMesa = Firecast.getRoomOf(sheet);
                              local chat = minhaMesa.chat;
                              local node = self.rclMagias.selectedNode;
                              Dialogs.showMessageDlg("Deseja Enviar na mesa ?",
                              dialogs.DT_INFORMATION,
                              {dialogs.DB_YES, dialogs.DB_NO}, function (escolha)
            
                              if escolha == dialogs.DB_YES then
                              chat:enviarMensagem("Efeito do " .. node.nome .. ":\n" .. node.Efeito)
                              end
            
                              end)
        end);

    obj._e_event122 = obj.rectangle98:addEventListener("onDblClick",
        function (event)
            local minhaMesa = Firecast.getRoomOf(sheet);
                                local chat = minhaMesa.chat;
                                local node = self.rclMagias.selectedNode;
                                Dialogs.showMessageDlg("Deseja Enviar na mesa ?",
                                dialogs.DT_INFORMATION,
                                {dialogs.DB_YES, dialogs.DB_NO}, function (escolha)
            
                                if escolha == dialogs.DB_YES then
                                chat:enviarMensagem("Testes do " .. node.nome .. ":\n" .. (node.defesa or ""))
                                end
            
                                end)
        end);

    obj._e_event123 = obj.rectangle100:addEventListener("onDblClick",
        function (event)
            local minhaMesa = Firecast.getRoomOf(sheet);
                                local chat = minhaMesa.chat;
                                local node = self.rclMagias.selectedNode;
                                Dialogs.showMessageDlg("Deseja Enviar na mesa ?",
                                dialogs.DT_INFORMATION,
                                {dialogs.DB_YES, dialogs.DB_NO}, function (escolha)
            
                                if escolha == dialogs.DB_YES then
                                chat:enviarMensagem("Bonus do " .. node.nome .. ":\n" .. node.Bonus)
                                end
            
                                end)
        end);

    obj._e_event124 = obj.button29:addEventListener("onClick",
        function (event)
            self.popUp.visible = false
        end);

    obj._e_event125 = obj.button30:addEventListener("onClick",
        function (event)
            self.popUp.visible = false
        end);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event125);
        __o_rrpgObjs.removeEventListenerById(self._e_event124);
        __o_rrpgObjs.removeEventListenerById(self._e_event123);
        __o_rrpgObjs.removeEventListenerById(self._e_event122);
        __o_rrpgObjs.removeEventListenerById(self._e_event121);
        __o_rrpgObjs.removeEventListenerById(self._e_event120);
        __o_rrpgObjs.removeEventListenerById(self._e_event119);
        __o_rrpgObjs.removeEventListenerById(self._e_event118);
        __o_rrpgObjs.removeEventListenerById(self._e_event117);
        __o_rrpgObjs.removeEventListenerById(self._e_event116);
        __o_rrpgObjs.removeEventListenerById(self._e_event115);
        __o_rrpgObjs.removeEventListenerById(self._e_event114);
        __o_rrpgObjs.removeEventListenerById(self._e_event113);
        __o_rrpgObjs.removeEventListenerById(self._e_event112);
        __o_rrpgObjs.removeEventListenerById(self._e_event111);
        __o_rrpgObjs.removeEventListenerById(self._e_event110);
        __o_rrpgObjs.removeEventListenerById(self._e_event109);
        __o_rrpgObjs.removeEventListenerById(self._e_event108);
        __o_rrpgObjs.removeEventListenerById(self._e_event107);
        __o_rrpgObjs.removeEventListenerById(self._e_event106);
        __o_rrpgObjs.removeEventListenerById(self._e_event105);
        __o_rrpgObjs.removeEventListenerById(self._e_event104);
        __o_rrpgObjs.removeEventListenerById(self._e_event103);
        __o_rrpgObjs.removeEventListenerById(self._e_event102);
        __o_rrpgObjs.removeEventListenerById(self._e_event101);
        __o_rrpgObjs.removeEventListenerById(self._e_event100);
        __o_rrpgObjs.removeEventListenerById(self._e_event99);
        __o_rrpgObjs.removeEventListenerById(self._e_event98);
        __o_rrpgObjs.removeEventListenerById(self._e_event97);
        __o_rrpgObjs.removeEventListenerById(self._e_event96);
        __o_rrpgObjs.removeEventListenerById(self._e_event95);
        __o_rrpgObjs.removeEventListenerById(self._e_event94);
        __o_rrpgObjs.removeEventListenerById(self._e_event93);
        __o_rrpgObjs.removeEventListenerById(self._e_event92);
        __o_rrpgObjs.removeEventListenerById(self._e_event91);
        __o_rrpgObjs.removeEventListenerById(self._e_event90);
        __o_rrpgObjs.removeEventListenerById(self._e_event89);
        __o_rrpgObjs.removeEventListenerById(self._e_event88);
        __o_rrpgObjs.removeEventListenerById(self._e_event87);
        __o_rrpgObjs.removeEventListenerById(self._e_event86);
        __o_rrpgObjs.removeEventListenerById(self._e_event85);
        __o_rrpgObjs.removeEventListenerById(self._e_event84);
        __o_rrpgObjs.removeEventListenerById(self._e_event83);
        __o_rrpgObjs.removeEventListenerById(self._e_event82);
        __o_rrpgObjs.removeEventListenerById(self._e_event81);
        __o_rrpgObjs.removeEventListenerById(self._e_event80);
        __o_rrpgObjs.removeEventListenerById(self._e_event79);
        __o_rrpgObjs.removeEventListenerById(self._e_event78);
        __o_rrpgObjs.removeEventListenerById(self._e_event77);
        __o_rrpgObjs.removeEventListenerById(self._e_event76);
        __o_rrpgObjs.removeEventListenerById(self._e_event75);
        __o_rrpgObjs.removeEventListenerById(self._e_event74);
        __o_rrpgObjs.removeEventListenerById(self._e_event73);
        __o_rrpgObjs.removeEventListenerById(self._e_event72);
        __o_rrpgObjs.removeEventListenerById(self._e_event71);
        __o_rrpgObjs.removeEventListenerById(self._e_event70);
        __o_rrpgObjs.removeEventListenerById(self._e_event69);
        __o_rrpgObjs.removeEventListenerById(self._e_event68);
        __o_rrpgObjs.removeEventListenerById(self._e_event67);
        __o_rrpgObjs.removeEventListenerById(self._e_event66);
        __o_rrpgObjs.removeEventListenerById(self._e_event65);
        __o_rrpgObjs.removeEventListenerById(self._e_event64);
        __o_rrpgObjs.removeEventListenerById(self._e_event63);
        __o_rrpgObjs.removeEventListenerById(self._e_event62);
        __o_rrpgObjs.removeEventListenerById(self._e_event61);
        __o_rrpgObjs.removeEventListenerById(self._e_event60);
        __o_rrpgObjs.removeEventListenerById(self._e_event59);
        __o_rrpgObjs.removeEventListenerById(self._e_event58);
        __o_rrpgObjs.removeEventListenerById(self._e_event57);
        __o_rrpgObjs.removeEventListenerById(self._e_event56);
        __o_rrpgObjs.removeEventListenerById(self._e_event55);
        __o_rrpgObjs.removeEventListenerById(self._e_event54);
        __o_rrpgObjs.removeEventListenerById(self._e_event53);
        __o_rrpgObjs.removeEventListenerById(self._e_event52);
        __o_rrpgObjs.removeEventListenerById(self._e_event51);
        __o_rrpgObjs.removeEventListenerById(self._e_event50);
        __o_rrpgObjs.removeEventListenerById(self._e_event49);
        __o_rrpgObjs.removeEventListenerById(self._e_event48);
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

        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.CD ~= nil then self.CD:destroy(); self.CD = nil; end;
        if self.Bonus ~= nil then self.Bonus:destroy(); self.Bonus = nil; end;
        if self.kekzin ~= nil then self.kekzin:destroy(); self.kekzin = nil; end;
        if self.edit200 ~= nil then self.edit200:destroy(); self.edit200 = nil; end;
        if self.edit216 ~= nil then self.edit216:destroy(); self.edit216 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.ROU_QUAD ~= nil then self.ROU_QUAD:destroy(); self.ROU_QUAD = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.rectangle85 ~= nil then self.rectangle85:destroy(); self.rectangle85 = nil; end;
        if self.rectangle71 ~= nil then self.rectangle71:destroy(); self.rectangle71 = nil; end;
        if self.rectangle95 ~= nil then self.rectangle95:destroy(); self.rectangle95 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.SABEDORIA ~= nil then self.SABEDORIA:destroy(); self.SABEDORIA = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.rectangle82 ~= nil then self.rectangle82:destroy(); self.rectangle82 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.rectangle90 ~= nil then self.rectangle90:destroy(); self.rectangle90 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.Intuicao ~= nil then self.Intuicao:destroy(); self.Intuicao = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.rectangle74 ~= nil then self.rectangle74:destroy(); self.rectangle74 = nil; end;
        if self.Enganacao ~= nil then self.Enganacao:destroy(); self.Enganacao = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.Atualidades ~= nil then self.Atualidades:destroy(); self.Atualidades = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.APAN_QUAD ~= nil then self.APAN_QUAD:destroy(); self.APAN_QUAD = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.VeiculosMagicos ~= nil then self.VeiculosMagicos:destroy(); self.VeiculosMagicos = nil; end;
        if self.Concentracao ~= nil then self.Concentracao:destroy(); self.Concentracao = nil; end;
        if self.tab11 ~= nil then self.tab11:destroy(); self.tab11 = nil; end;
        if self.edit176 ~= nil then self.edit176:destroy(); self.edit176 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.tab14 ~= nil then self.tab14:destroy(); self.tab14 = nil; end;
        if self.DEFE_QUAD ~= nil then self.DEFE_QUAD:destroy(); self.DEFE_QUAD = nil; end;
        if self.ANTE_QUAD ~= nil then self.ANTE_QUAD:destroy(); self.ANTE_QUAD = nil; end;
        if self.edit171 ~= nil then self.edit171:destroy(); self.edit171 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.Furtividade ~= nil then self.Furtividade:destroy(); self.Furtividade = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.rectangle63 ~= nil then self.rectangle63:destroy(); self.rectangle63 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.rectangle64 ~= nil then self.rectangle64:destroy(); self.rectangle64 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.Frustrado ~= nil then self.Frustrado:destroy(); self.Frustrado = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.edit198 ~= nil then self.edit198:destroy(); self.edit198 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.tipo ~= nil then self.tipo:destroy(); self.tipo = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.richEdit4 ~= nil then self.richEdit4:destroy(); self.richEdit4 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.edit184 ~= nil then self.edit184:destroy(); self.edit184 = nil; end;
        if self.edit192 ~= nil then self.edit192:destroy(); self.edit192 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.Fortitude ~= nil then self.Fortitude:destroy(); self.Fortitude = nil; end;
        if self.edit189 ~= nil then self.edit189:destroy(); self.edit189 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.edit208 ~= nil then self.edit208:destroy(); self.edit208 = nil; end;
        if self.version ~= nil then self.version:destroy(); self.version = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.edit203 ~= nil then self.edit203:destroy(); self.edit203 = nil; end;
        if self.edit213 ~= nil then self.edit213:destroy(); self.edit213 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.Atletismo ~= nil then self.Atletismo:destroy(); self.Atletismo = nil; end;
        if self.rectangle98 ~= nil then self.rectangle98:destroy(); self.rectangle98 = nil; end;
        if self.edit206 ~= nil then self.edit206:destroy(); self.edit206 = nil; end;
        if self.edit214 ~= nil then self.edit214:destroy(); self.edit214 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.Adivinhacao ~= nil then self.Adivinhacao:destroy(); self.Adivinhacao = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.rectangle87 ~= nil then self.rectangle87:destroy(); self.rectangle87 = nil; end;
        if self.rectangle97 ~= nil then self.rectangle97:destroy(); self.rectangle97 = nil; end;
        if self.rectangle77 ~= nil then self.rectangle77:destroy(); self.rectangle77 = nil; end;
        if self.REBA_QUAD ~= nil then self.REBA_QUAD:destroy(); self.REBA_QUAD = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.rectangle92 ~= nil then self.rectangle92:destroy(); self.rectangle92 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.rectangle89 ~= nil then self.rectangle89:destroy(); self.rectangle89 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.tab17 ~= nil then self.tab17:destroy(); self.tab17 = nil; end;
        if self.tab9 ~= nil then self.tab9:destroy(); self.tab9 = nil; end;
        if self.edit174 ~= nil then self.edit174:destroy(); self.edit174 = nil; end;
        if self.form1 ~= nil then self.form1:destroy(); self.form1 = nil; end;
        if self.Grad ~= nil then self.Grad:destroy(); self.Grad = nil; end;
        if self.rectangle100 ~= nil then self.rectangle100:destroy(); self.rectangle100 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.Iniciativa ~= nil then self.Iniciativa:destroy(); self.Iniciativa = nil; end;
        if self.AGILIDADE ~= nil then self.AGILIDADE:destroy(); self.AGILIDADE = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.Efeito ~= nil then self.Efeito:destroy(); self.Efeito = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.PASS_QUAD ~= nil then self.PASS_QUAD:destroy(); self.PASS_QUAD = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.rectangle ~= nil then self.rectangle:destroy(); self.rectangle = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.Acrobacia ~= nil then self.Acrobacia:destroy(); self.Acrobacia = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.richEdit3 ~= nil then self.richEdit3:destroy(); self.richEdit3 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit181 ~= nil then self.edit181:destroy(); self.edit181 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.edit191 ~= nil then self.edit191:destroy(); self.edit191 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.richEdit6 ~= nil then self.richEdit6:destroy(); self.richEdit6 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.edit186 ~= nil then self.edit186:destroy(); self.edit186 = nil; end;
        if self.edit194 ~= nil then self.edit194:destroy(); self.edit194 = nil; end;
        if self.VIGOR ~= nil then self.VIGOR:destroy(); self.VIGOR = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.LUTA ~= nil then self.LUTA:destroy(); self.LUTA = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.CorpoACorpo ~= nil then self.CorpoACorpo:destroy(); self.CorpoACorpo = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.Tiltado ~= nil then self.Tiltado:destroy(); self.Tiltado = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.Investigacao ~= nil then self.Investigacao:destroy(); self.Investigacao = nil; end;
        if self.Poder ~= nil then self.Poder:destroy(); self.Poder = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.Duracao ~= nil then self.Duracao:destroy(); self.Duracao = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.VEL_QUAD ~= nil then self.VEL_QUAD:destroy(); self.VEL_QUAD = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.edit201 ~= nil then self.edit201:destroy(); self.edit201 = nil; end;
        if self.edit211 ~= nil then self.edit211:destroy(); self.edit211 = nil; end;
        if self.Vontade ~= nil then self.Vontade:destroy(); self.Vontade = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.rectangle84 ~= nil then self.rectangle84:destroy(); self.rectangle84 = nil; end;
        if self.Dano ~= nil then self.Dano:destroy(); self.Dano = nil; end;
        if self.Encantamentos ~= nil then self.Encantamentos:destroy(); self.Encantamentos = nil; end;
        if self.rectangle72 ~= nil then self.rectangle72:destroy(); self.rectangle72 = nil; end;
        if self.edit204 ~= nil then self.edit204:destroy(); self.edit204 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.rectangle81 ~= nil then self.rectangle81:destroy(); self.rectangle81 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.rectangle91 ~= nil then self.rectangle91:destroy(); self.rectangle91 = nil; end;
        if self.layout117 ~= nil then self.layout117:destroy(); self.layout117 = nil; end;
        if self.rectangle75 ~= nil then self.rectangle75:destroy(); self.rectangle75 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.Tratamento ~= nil then self.Tratamento:destroy(); self.Tratamento = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.tabControl2 ~= nil then self.tabControl2:destroy(); self.tabControl2 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.Herbologia ~= nil then self.Herbologia:destroy(); self.Herbologia = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.rectangle78 ~= nil then self.rectangle78:destroy(); self.rectangle78 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.Area ~= nil then self.Area:destroy(); self.Area = nil; end;
        if self.tab12 ~= nil then self.tab12:destroy(); self.tab12 = nil; end;
        if self.edit177 ~= nil then self.edit177:destroy(); self.edit177 = nil; end;
        if self.Azaracao ~= nil then self.Azaracao:destroy(); self.Azaracao = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout118 ~= nil then self.layout118:destroy(); self.layout118 = nil; end;
        if self.tab15 ~= nil then self.tab15:destroy(); self.tab15 = nil; end;
        if self.edit172 ~= nil then self.edit172:destroy(); self.edit172 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.tab18 ~= nil then self.tab18:destroy(); self.tab18 = nil; end;
        if self.rectangle102 ~= nil then self.rectangle102:destroy(); self.rectangle102 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.rectangle69 ~= nil then self.rectangle69:destroy(); self.rectangle69 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.ContraFeitico ~= nil then self.ContraFeitico:destroy(); self.ContraFeitico = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.edit178 ~= nil then self.edit178:destroy(); self.edit178 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.rectangle67 ~= nil then self.rectangle67:destroy(); self.rectangle67 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.edit199 ~= nil then self.edit199:destroy(); self.edit199 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.richEdit5 ~= nil then self.richEdit5:destroy(); self.richEdit5 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.Runas ~= nil then self.Runas:destroy(); self.Runas = nil; end;
        if self.Resistencia ~= nil then self.Resistencia:destroy(); self.Resistencia = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.edit183 ~= nil then self.edit183:destroy(); self.edit183 = nil; end;
        if self.edit193 ~= nil then self.edit193:destroy(); self.edit193 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.richEdit8 ~= nil then self.richEdit8:destroy(); self.richEdit8 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.edit188 ~= nil then self.edit188:destroy(); self.edit188 = nil; end;
        if self.edit196 ~= nil then self.edit196:destroy(); self.edit196 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.ATRA_QUAD ~= nil then self.ATRA_QUAD:destroy(); self.ATRA_QUAD = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.edit209 ~= nil then self.edit209:destroy(); self.edit209 = nil; end;
        if self.DESTREZA ~= nil then self.DESTREZA:destroy(); self.DESTREZA = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
        if self.popUp ~= nil then self.popUp:destroy(); self.popUp = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.edit212 ~= nil then self.edit212:destroy(); self.edit212 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.rectangle99 ~= nil then self.rectangle99:destroy(); self.rectangle99 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.edit207 ~= nil then self.edit207:destroy(); self.edit207 = nil; end;
        if self.edit217 ~= nil then self.edit217:destroy(); self.edit217 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.rectangle86 ~= nil then self.rectangle86:destroy(); self.rectangle86 = nil; end;
        if self.rectangle94 ~= nil then self.rectangle94:destroy(); self.rectangle94 = nil; end;
        if self.Range ~= nil then self.Range:destroy(); self.Range = nil; end;
        if self.rectangle70 ~= nil then self.rectangle70:destroy(); self.rectangle70 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.DCAT ~= nil then self.DCAT:destroy(); self.DCAT = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.rectangle83 ~= nil then self.rectangle83:destroy(); self.rectangle83 = nil; end;
        if self.rectangle93 ~= nil then self.rectangle93:destroy(); self.rectangle93 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.rectangle88 ~= nil then self.rectangle88:destroy(); self.rectangle88 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.INTELIGENCIA ~= nil then self.INTELIGENCIA:destroy(); self.INTELIGENCIA = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.FORCA ~= nil then self.FORCA:destroy(); self.FORCA = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.tab10 ~= nil then self.tab10:destroy(); self.tab10 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.edit175 ~= nil then self.edit175:destroy(); self.edit175 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.rectangle101 ~= nil then self.rectangle101:destroy(); self.rectangle101 = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.Feiticos ~= nil then self.Feiticos:destroy(); self.Feiticos = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.aqui ~= nil then self.aqui:destroy(); self.aqui = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle65 ~= nil then self.rectangle65:destroy(); self.rectangle65 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.Intimidacao ~= nil then self.Intimidacao:destroy(); self.Intimidacao = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit180 ~= nil then self.edit180:destroy(); self.edit180 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.richEdit7 ~= nil then self.richEdit7:destroy(); self.richEdit7 = nil; end;
        if self.rclMagias ~= nil then self.rclMagias:destroy(); self.rclMagias = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.Prestidigitacao ~= nil then self.Prestidigitacao:destroy(); self.Prestidigitacao = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit185 ~= nil then self.edit185:destroy(); self.edit185 = nil; end;
        if self.edit195 ~= nil then self.edit195:destroy(); self.edit195 = nil; end;
        if self.Transmutacao ~= nil then self.Transmutacao:destroy(); self.Transmutacao = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.Exausto ~= nil then self.Exausto:destroy(); self.Exausto = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.FALTA_QUAD ~= nil then self.FALTA_QUAD:destroy(); self.FALTA_QUAD = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.Reflexo ~= nil then self.Reflexo:destroy(); self.Reflexo = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.Persuacao ~= nil then self.Persuacao:destroy(); self.Persuacao = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.outrasPericias_record ~= nil then self.outrasPericias_record:destroy(); self.outrasPericias_record = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit202 ~= nil then self.edit202:destroy(); self.edit202 = nil; end;
        if self.edit210 ~= nil then self.edit210:destroy(); self.edit210 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.Percepcao ~= nil then self.Percepcao:destroy(); self.Percepcao = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.edit205 ~= nil then self.edit205:destroy(); self.edit205 = nil; end;
        if self.rectangle73 ~= nil then self.rectangle73:destroy(); self.rectangle73 = nil; end;
        if self.edit215 ~= nil then self.edit215:destroy(); self.edit215 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.Aparar ~= nil then self.Aparar:destroy(); self.Aparar = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.rectangle80 ~= nil then self.rectangle80:destroy(); self.rectangle80 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.rectangle96 ~= nil then self.rectangle96:destroy(); self.rectangle96 = nil; end;
        if self.tabControl4 ~= nil then self.tabControl4:destroy(); self.tabControl4 = nil; end;
        if self.rectangle76 ~= nil then self.rectangle76:destroy(); self.rectangle76 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.tabControl3 ~= nil then self.tabControl3:destroy(); self.tabControl3 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.rectangle79 ~= nil then self.rectangle79:destroy(); self.rectangle79 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.escola ~= nil then self.escola:destroy(); self.escola = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.Fadigado ~= nil then self.Fadigado:destroy(); self.Fadigado = nil; end;
        if self.tab13 ~= nil then self.tab13:destroy(); self.tab13 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.layout119 ~= nil then self.layout119:destroy(); self.layout119 = nil; end;
        if self.tab16 ~= nil then self.tab16:destroy(); self.tab16 = nil; end;
        if self.edit173 ~= nil then self.edit173:destroy(); self.edit173 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.rectangle103 ~= nil then self.rectangle103:destroy(); self.rectangle103 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.rectangle68 ~= nil then self.rectangle68:destroy(); self.rectangle68 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.DRI_QUAD ~= nil then self.DRI_QUAD:destroy(); self.DRI_QUAD = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.edit179 ~= nil then self.edit179:destroy(); self.edit179 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.rectangle66 ~= nil then self.rectangle66:destroy(); self.rectangle66 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.nome ~= nil then self.nome:destroy(); self.nome = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit182 ~= nil then self.edit182:destroy(); self.edit182 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit190 ~= nil then self.edit190:destroy(); self.edit190 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit187 ~= nil then self.edit187:destroy(); self.edit187 = nil; end;
        if self.edit197 ~= nil then self.edit197:destroy(); self.edit197 = nil; end;
        if self.CriaturasMagicas ~= nil then self.CriaturasMagicas:destroy(); self.CriaturasMagicas = nil; end;
        if self.PRESENCA ~= nil then self.PRESENCA:destroy(); self.PRESENCA = nil; end;
        if self.Pocoes ~= nil then self.Pocoes:destroy(); self.Pocoes = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.GOL_QUAD ~= nil then self.GOL_QUAD:destroy(); self.GOL_QUAD = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
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
    cacheMode = "none", 
    title = "Ficha Harry Potter Nova!", 
    description=""};

HarryFicha = _HarryFicha;
Firecast.registrarForm(_HarryFicha);
Firecast.registrarDataType(_HarryFicha);

return _HarryFicha;
