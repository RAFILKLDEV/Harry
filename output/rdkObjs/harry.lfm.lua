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

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setStyle("autoFit");
    obj.image1:setTop(0);
    obj.image1:setWidth(1300);
    obj.image1:setHeight(800);
    obj.image1:setSRC("/imagens/wizard.jpg");
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(100);
    obj.layout1:setPadding({top=5, left=5});
    obj.layout1:setName("layout1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(80);
    obj.layout2:setMargins({top=10, left=0});
    obj.layout2:setName("layout2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setAlign("left");
    obj.layout3:setMargins({left=20});
    obj.layout3:setWidth(120);
    obj.layout3:setHeight(80);
    obj.layout3:setName("layout3");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout3);
    obj.rectangle1:setTop(5);
    obj.rectangle1:setLeft(10);
    obj.rectangle1:setColor("DarkSlateBlue");
    obj.rectangle1:setWidth(90);
    obj.rectangle1:setHeight(25);
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setAlign("client");
    obj.label1:setText("Destreza");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout3);
    obj.edit1:setTop(30);
    obj.edit1:setWidth(120);
    obj.edit1:setField("DES");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout2);
    obj.layout4:setAlign("left");
    obj.layout4:setMargins({left=20});
    obj.layout4:setWidth(120);
    obj.layout4:setHeight(80);
    obj.layout4:setName("layout4");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout4);
    obj.rectangle2:setTop(5);
    obj.rectangle2:setLeft(10);
    obj.rectangle2:setColor("DarkSlateBlue");
    obj.rectangle2:setWidth(90);
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setName("rectangle2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle2);
    obj.label3:setAlign("client");
    obj.label3:setText("Adivinhação");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout4);
    obj.edit2:setTop(30);
    obj.edit2:setWidth(120);
    obj.edit2:setField("adivinhacao");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout2);
    obj.layout5:setAlign("left");
    obj.layout5:setMargins({left=20});
    obj.layout5:setWidth(120);
    obj.layout5:setHeight(80);
    obj.layout5:setName("layout5");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout5);
    obj.rectangle3:setTop(5);
    obj.rectangle3:setLeft(10);
    obj.rectangle3:setColor("DarkSlateBlue");
    obj.rectangle3:setWidth(90);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setName("rectangle3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle3);
    obj.label4:setAlign("client");
    obj.label4:setText("Azaração");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout5);
    obj.edit3:setTop(30);
    obj.edit3:setWidth(120);
    obj.edit3:setField("azaracao");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout2);
    obj.layout6:setAlign("left");
    obj.layout6:setMargins({left=20});
    obj.layout6:setWidth(120);
    obj.layout6:setHeight(80);
    obj.layout6:setName("layout6");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout6);
    obj.rectangle4:setTop(5);
    obj.rectangle4:setLeft(10);
    obj.rectangle4:setColor("DarkSlateBlue");
    obj.rectangle4:setWidth(90);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setName("rectangle4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle4);
    obj.label5:setAlign("client");
    obj.label5:setText("Contra-Feitiço");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout6);
    obj.edit4:setTop(30);
    obj.edit4:setWidth(120);
    obj.edit4:setField("contraFeitico");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setName("edit4");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout2);
    obj.layout7:setAlign("left");
    obj.layout7:setMargins({left=20});
    obj.layout7:setWidth(120);
    obj.layout7:setHeight(80);
    obj.layout7:setName("layout7");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout7);
    obj.rectangle5:setTop(5);
    obj.rectangle5:setLeft(10);
    obj.rectangle5:setColor("DarkSlateBlue");
    obj.rectangle5:setWidth(90);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setName("rectangle5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle5);
    obj.label6:setAlign("client");
    obj.label6:setText("Encantamento");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout7);
    obj.edit5:setTop(30);
    obj.edit5:setWidth(120);
    obj.edit5:setField("encantamento");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setName("edit5");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout2);
    obj.layout8:setAlign("left");
    obj.layout8:setMargins({left=20});
    obj.layout8:setWidth(120);
    obj.layout8:setHeight(80);
    obj.layout8:setName("layout8");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout8);
    obj.rectangle6:setTop(5);
    obj.rectangle6:setLeft(10);
    obj.rectangle6:setColor("DarkSlateBlue");
    obj.rectangle6:setWidth(90);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setName("rectangle6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle6);
    obj.label7:setAlign("client");
    obj.label7:setText("Feitiço");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout8);
    obj.edit6:setTop(30);
    obj.edit6:setWidth(120);
    obj.edit6:setField("feitico");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setName("edit6");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout2);
    obj.layout9:setAlign("left");
    obj.layout9:setMargins({left=20});
    obj.layout9:setWidth(120);
    obj.layout9:setHeight(80);
    obj.layout9:setName("layout9");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout9);
    obj.rectangle7:setTop(5);
    obj.rectangle7:setLeft(10);
    obj.rectangle7:setColor("DarkSlateBlue");
    obj.rectangle7:setWidth(90);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setName("rectangle7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle7);
    obj.label8:setAlign("client");
    obj.label8:setText("Transmutação");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout9);
    obj.edit7:setTop(30);
    obj.edit7:setWidth(120);
    obj.edit7:setField("transmutacao");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setName("edit7");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout2);
    obj.layout10:setAlign("left");
    obj.layout10:setMargins({left=20});
    obj.layout10:setWidth(120);
    obj.layout10:setHeight(80);
    obj.layout10:setName("layout10");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout10);
    obj.rectangle8:setTop(5);
    obj.rectangle8:setLeft(10);
    obj.rectangle8:setColor("DarkSlateBlue");
    obj.rectangle8:setWidth(90);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setName("rectangle8");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle8);
    obj.label9:setAlign("client");
    obj.label9:setText("Arte das Trevas");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout10);
    obj.edit8:setTop(30);
    obj.edit8:setWidth(120);
    obj.edit8:setField("arteDasTrevas");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setName("edit8");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.scrollBox1);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(80);
    obj.layout11:setMargins({top=0, left=0});
    obj.layout11:setName("layout11");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout11);
    obj.layout12:setAlign("left");
    obj.layout12:setMargins({left=20});
    obj.layout12:setWidth(120);
    obj.layout12:setHeight(80);
    obj.layout12:setName("layout12");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout12);
    obj.rectangle9:setTop(5);
    obj.rectangle9:setLeft(10);
    obj.rectangle9:setColor("#6B8E23");
    obj.rectangle9:setWidth(90);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setName("rectangle9");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle9);
    obj.label10:setAlign("client");
    obj.label10:setText("Fisico");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout12);
    obj.edit9:setTop(30);
    obj.edit9:setWidth(120);
    obj.edit9:setField("fisico");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setName("edit9");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout11);
    obj.layout13:setAlign("left");
    obj.layout13:setMargins({left=20});
    obj.layout13:setWidth(120);
    obj.layout13:setHeight(80);
    obj.layout13:setName("layout13");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout13);
    obj.rectangle10:setTop(5);
    obj.rectangle10:setLeft(10);
    obj.rectangle10:setColor("#6B8E23");
    obj.rectangle10:setWidth(90);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setName("rectangle10");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle10);
    obj.label11:setAlign("client");
    obj.label11:setText("Mental");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout13);
    obj.edit10:setTop(30);
    obj.edit10:setWidth(120);
    obj.edit10:setField("mental");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setName("edit10");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout11);
    obj.layout14:setAlign("left");
    obj.layout14:setMargins({left=20});
    obj.layout14:setWidth(120);
    obj.layout14:setHeight(80);
    obj.layout14:setName("layout14");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout14);
    obj.rectangle11:setTop(5);
    obj.rectangle11:setLeft(10);
    obj.rectangle11:setColor("purple");
    obj.rectangle11:setWidth(90);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setName("rectangle11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle11);
    obj.label12:setAlign("client");
    obj.label12:setText("Concentração");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout14);
    obj.edit11:setTop(30);
    obj.edit11:setWidth(120);
    obj.edit11:setField("concentracao");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setName("edit11");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout11);
    obj.layout15:setAlign("left");
    obj.layout15:setMargins({left=20});
    obj.layout15:setWidth(120);
    obj.layout15:setHeight(80);
    obj.layout15:setName("layout15");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout15);
    obj.rectangle12:setTop(5);
    obj.rectangle12:setLeft(10);
    obj.rectangle12:setColor("purple");
    obj.rectangle12:setWidth(90);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setName("rectangle12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle12);
    obj.label13:setAlign("client");
    obj.label13:setText("Acerto");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout15);
    obj.edit12:setTop(30);
    obj.edit12:setWidth(120);
    obj.edit12:setField("acerto");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setName("edit12");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.scrollBox1);
    obj.layout16:setAlign("top");
    obj.layout16:setHeight(600);
    obj.layout16:setPadding({top=5, left=5});
    obj.layout16:setName("layout16");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout16);
    obj.button1:setLeft(20);
    obj.button1:setTop(20);
    obj.button1:setHeight(25);
    obj.button1:setText("Novo Feitiço");
    obj.button1:setWidth(100);
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout16);
    obj.button2:setLeft(130);
    obj.button2:setTop(20);
    obj.button2:setHeight(25);
    obj.button2:setText("Ordenar");
    obj.button2:setWidth(100);
    obj.button2:setName("button2");

    obj.rclMagias = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMagias:setParent(obj.layout16);
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

    obj._e_event1 = obj.edit1:addEventListener("onUserChange",
        function (_)
        end, obj);

    obj._e_event2 = obj.edit2:addEventListener("onUserChange",
        function (_)
        end, obj);

    obj._e_event3 = obj.edit3:addEventListener("onUserChange",
        function (_)
        end, obj);

    obj._e_event4 = obj.edit4:addEventListener("onUserChange",
        function (_)
        end, obj);

    obj._e_event5 = obj.edit5:addEventListener("onUserChange",
        function (_)
        end, obj);

    obj._e_event6 = obj.edit6:addEventListener("onUserChange",
        function (_)
        end, obj);

    obj._e_event7 = obj.edit7:addEventListener("onUserChange",
        function (_)
        end, obj);

    obj._e_event8 = obj.edit8:addEventListener("onUserChange",
        function (_)
        end, obj);

    obj._e_event9 = obj.edit9:addEventListener("onUserChange",
        function (_)
            local minhaMesa = Firecast.getRoomOf(sheet);
                                          local chat = minhaMesa.chat;
            
                                          chat:enviarAcao("esta com penalidade em Fisico de " .. sheet.fisico)
        end, obj);

    obj._e_event10 = obj.edit10:addEventListener("onUserChange",
        function (_)
            local minhaMesa = Firecast.getRoomOf(sheet);
                                          local chat = minhaMesa.chat;
            
                                          chat:enviarAcao("esta com penalidade em Mental de " .. sheet.mental)
        end, obj);

    obj._e_event11 = obj.edit11:addEventListener("onUserChange",
        function (_)
        end, obj);

    obj._e_event12 = obj.edit12:addEventListener("onUserChange",
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
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rclMagias ~= nil then self.rclMagias:destroy(); self.rclMagias = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
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
