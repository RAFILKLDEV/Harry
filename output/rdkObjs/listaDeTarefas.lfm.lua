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
    obj:setName("frmItemDeMagia");
    obj:setHeight(50);
    obj:setMargins({top=2,bottom=2});

    obj.Keko = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.Keko:setParent(obj);
    obj.Keko:setName("Keko");
    obj.Keko:setPadding({top=5, bottom=5});
    obj.Keko:setAlign("top");
    obj.Keko:setHeight(35);

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.Keko);
    obj.edit1:setAlign("left");
    obj.edit1:setWidth(200);
    obj.edit1:setField("");
    obj.edit1:setMargins({left=5});
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.Keko);
    obj.edit2:setAlign("left");
    obj.edit2:setWidth(25);
    obj.edit2:setField("");
    obj.edit2:setMargins({left=5});
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.Keko);
    obj.edit3:setAlign("left");
    obj.edit3:setWidth(25);
    obj.edit3:setField("");
    obj.edit3:setMargins({left=5});
    obj.edit3:setName("edit3");

    obj.CheckBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.CheckBox1:setParent(obj.Keko);
    obj.CheckBox1:setAlign("left");
    obj.CheckBox1:setWidth(30);
    obj.CheckBox1:setName("CheckBox1");
    obj.CheckBox1:setField("");
    obj.CheckBox1:setMargins({left=10});

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setAlign("top");
    obj.button1:setText("Apagar");
    obj.button1:setHeight(15);
    obj.button1:setName("button1");

    obj._e_event0 = obj.CheckBox1:addEventListener("onChange",
        function (_)
            if self.CheckBox1.checked then
                                self.Keko.color = "green"
                                else
                                self.Keko.color = "gray"
                                end
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (_, event)
            ndb.deleteNode(sheet);
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.Keko ~= nil then self.Keko:destroy(); self.Keko = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.CheckBox1 ~= nil then self.CheckBox1:destroy(); self.CheckBox1 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
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
    title = "", 
    description=""};

frmItemDeMagia = _frmItemDeMagia;
Firecast.registrarForm(_frmItemDeMagia);

return _frmItemDeMagia;
