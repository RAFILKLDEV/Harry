require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmItemDeMagia()
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
    obj:setName("frmItemDeMagia");
    obj:setHeight(50);
    obj:setMargins({top=2,bottom=2});

    obj.rectangle = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle:setParent(obj);
    obj.rectangle:setName("rectangle");
    obj.rectangle:setPadding({top=5, bottom=5});
    obj.rectangle:setAlign("top");
    obj.rectangle:setHeight(35);

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle);
    obj.edit1:setAlign("left");
    obj.edit1:setWidth(180);
    obj.edit1:setField("nome");
    obj.edit1:setMargins({left=5});
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle);
    obj.edit2:setAlign("left");
    obj.edit2:setWidth(25);
    obj.edit2:setField("atual");
    obj.edit2:setMargins({left=5});
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle);
    obj.edit3:setAlign("left");
    obj.edit3:setWidth(25);
    obj.edit3:setField("max");
    obj.edit3:setMargins({left=5});
    obj.edit3:setName("edit3");

    obj.checkBox = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox:setParent(obj.rectangle);
    obj.checkBox:setAlign("left");
    obj.checkBox:setWidth(30);
    obj.checkBox:setName("checkBox");
    obj.checkBox:setField("checkBox1");
    obj.checkBox:setMargins({left=10});

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setAlign("top");
    obj.button1:setText("Apagar");
    obj.button1:setHeight(15);
    obj.button1:setName("button1");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function ()
            if self.checkBox.checked then
                    self.rectangle.color = "green"
                    end
        end);

    obj._e_event1 = obj.checkBox:addEventListener("onChange",
        function ()
            if self.checkBox.checked then
                            self.rectangle.color = "green"
                            else
                            self.rectangle.color = "gray"
                            end
        end);

    obj._e_event2 = obj.button1:addEventListener("onClick",
        function (event)
            require("dialogs.lua");
            
                        Dialogs.confirmOkCancel("Deseja realmente excluir esta tarefa ?",
                        function (confirmado)
                        if confirmado then
                        ndb.deleteNode(sheet)
                        else
                        -- usuário escolheu CANCEL
                        end;
                        end);
        end);

    function obj:_releaseEvents()
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

        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.rectangle ~= nil then self.rectangle:destroy(); self.rectangle = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.checkBox ~= nil then self.checkBox:destroy(); self.checkBox = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmItemDeMagia()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmItemDeMagia();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmItemDeMagia = {
    newEditor = newfrmItemDeMagia, 
    new = newfrmItemDeMagia, 
    name = "frmItemDeMagia", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "", 
    description=""};

frmItemDeMagia = _frmItemDeMagia;
Firecast.registrarForm(_frmItemDeMagia);

return _frmItemDeMagia;
