require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_outrasPericias()
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
    obj:setName("outrasPericias");
    obj:setHeight(40);
    obj:setMargins({top=2,bottom=2});

    obj.DATALINK = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.DATALINK:setParent(obj);
    obj.DATALINK:setName("DATALINK");
    obj.DATALINK:setFields({'ATR','OUT','GRAD','ATRIBUTO','AGI'});

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setHeight(30);
    obj.layout1:setAlign("top");
    obj.layout1:setMargins({top=3});
    obj.layout1:setName("layout1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setMargins({right=5});
    obj.button1:setAlign("left");
    obj.button1:setText("R");
    obj.button1:setWidth(30);
    obj.button1:setName("button1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setField("ATRIBUTO");
    obj.edit1:setVisible(false);
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout1);
    obj.edit2:setAlign("left");
    obj.edit2:setWidth(120);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setField("NOME");
    obj.edit2:setName("edit2");

    obj.ATR = GUI.fromHandle(_obj_newObject("edit"));
    obj.ATR:setParent(obj.layout1);
    obj.ATR:setType("number");
    obj.ATR:setName("ATR");
    obj.ATR:setField("ATR");
    obj.ATR:setAlign("left");
    obj.ATR:setMargins({left = 5});
    obj.ATR:setWidth(30);
    obj.ATR:setReadOnly(true);
    obj.ATR:setHorzTextAlign("center");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout1);
    obj.edit3:setType("number");
    obj.edit3:setField("GRAD");
    obj.edit3:setAlign("left");
    obj.edit3:setMargins({left = 5});
    obj.edit3:setWidth(30);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout1);
    obj.edit4:setType("number");
    obj.edit4:setField("OUT");
    obj.edit4:setAlign("left");
    obj.edit4:setMargins({left = 5});
    obj.edit4:setWidth(30);
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setName("edit4");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setField("TOTAL");
    obj.label1:setAlign("left");
    obj.label1:setMargins({left = 5});
    obj.label1:setWidth(30);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout1);
    obj.button2:setMargins({left=15});
    obj.button2:setAlign("right");
    obj.button2:setText("X");
    obj.button2:setWidth(22);
    obj.button2:setName("button2");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function ()
        end);

    obj._e_event1 = obj.DATALINK:addEventListener("onChange",
        function (field, oldValue, newValue)
            local node = NDB.getRoot(sheet)
                        if sheet.ATRIBUTO == "AGI" then
                        sheet.TOTAL = (node.AGI or 0) + (sheet.GRAD or 0) + (sheet.OUT or 0)
                        elseif sheet.ATRIBUTO == "DES" then
                        sheet.TOTAL = (node.DES or 0) + (sheet.GRAD or 0) + (sheet.OUT or 0)
                        elseif sheet.ATRIBUTO == "FOR" then
                        sheet.TOTAL = (node.FOR or 0) + (sheet.GRAD or 0) + (sheet.OUT or 0)
                        elseif sheet.ATRIBUTO == "LUT" then
                        sheet.TOTAL = (node.LUT or 0) + (sheet.GRAD or 0) + (sheet.OUT or 0)
                        elseif sheet.ATRIBUTO == "VIG" then
                        sheet.TOTAL = (node.VIG or 0) + (sheet.GRAD or 0) + (sheet.OUT or 0)
                        elseif sheet.ATRIBUTO == "INTE" then
                        sheet.TOTAL = (node.INTE or 0) + (sheet.GRAD or 0) + (sheet.OUT or 0)
                        elseif sheet.ATRIBUTO == "PRE" then
                        sheet.TOTAL = (node.PRE or 0) + (sheet.GRAD or 0) + (sheet.OUT or 0)
                        elseif sheet.ATRIBUTO == "SAB" then
                        sheet.TOTAL = (node.SAB or 0) + (sheet.GRAD or 0) + (sheet.OUT or 0)
                        else
                        sheet.TOTAL = 0 + (sheet.GRAD or 0) + (sheet.OUT or 0)
                        end
        end);

    obj._e_event2 = obj.button1:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
                            local chat = mesaDoPersonagem.chat
            
                            chat:rolarDados("1d20 + " .. (sheet.TOTAL or 0),
                            sheet.NOME,
                            function (rolado)
            
                            end);
        end);

    obj._e_event3 = obj.ATR:addEventListener("onClick",
        function (event)
            Dialogs.choose("Selecione o Atributo", {"Agilidade", "Destreza", "Força",
                            "Luta", "Vigor", "Inteligência", "Presença", "Destreza"},
                            function(selected, selectedIndex, selectedText)
            
                            local node = NDB.getRoot(sheet)
            
                            if selectedIndex == 1 then
            
                            sheet.ATRIBUTO = "AGI"
                            sheet.ATR = node.AGI
            
                            elseif selectedIndex == 2 then
            
                            sheet.ATRIBUTO = "DES"
                            sheet.ATR = node.DES
            
                            elseif selectedIndex == 3 then
            
                            sheet.ATRIBUTO = "FOR"
                            sheet.ATR = node.FOR
            
                            elseif selectedIndex == 4 then
            
                            sheet.ATRIBUTO = "LUT"
                            sheet.ATR = node.LUT
            
                            elseif selectedIndex == 5 then
            
                            sheet.ATRIBUTO = "VIG"
                            sheet.ATR = node.VIG
            
                            elseif selectedIndex == 6 then
            
                            sheet.ATRIBUTO = "INTE"
                            sheet.ATR = node.INTE
            
                            elseif selectedIndex == 7 then
            
                            sheet.ATRIBUTO = "PRE"
                            sheet.ATR = node.PRE
            
                            elseif selectedIndex == 8 then
            
                            sheet.ATRIBUTO = "SAB"
                            sheet.ATR = node.SAB
            
                            else
            
                            end;
            
                            end)
        end);

    obj._e_event4 = obj.button2:addEventListener("onClick",
        function (event)
            require("dialogs.lua");
            
                            Dialogs.confirmOkCancel("Deseja realmente excluir esta pericia ?",
                            function (confirmado)
                            if confirmado then
                            ndb.deleteNode(sheet)
                            else
                            -- usuário escolheu CANCEL
                            end;
                            end);
        end);

    function obj:_releaseEvents()
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

        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.ATR ~= nil then self.ATR:destroy(); self.ATR = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.DATALINK ~= nil then self.DATALINK:destroy(); self.DATALINK = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newoutrasPericias()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_outrasPericias();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _outrasPericias = {
    newEditor = newoutrasPericias, 
    new = newoutrasPericias, 
    name = "outrasPericias", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "", 
    description=""};

outrasPericias = _outrasPericias;
Firecast.registrarForm(_outrasPericias);

return _outrasPericias;
