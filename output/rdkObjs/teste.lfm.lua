require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_feiticosFacil()
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
    obj:setName("feiticosFacil");
    obj:setWidth(600);
    obj:setHeight(70);
    obj:setMargins({top=2,bottom=2});


        -- Primeiro, é necessário usar a unidade "dialogs.lua"
        require("dialogs.lua");

        local function Aceitar()
        Dialogs.confirmOkCancel("Deseja Apagar esse Feitiço ?",
        function (confirmado)
        if confirmado then
        ndb.deleteNode(sheet);
        else
        return
        end;
        end);

        end

        local function enviarNaMesa()

        local minhaMesa = Firecast.getRoomOf(sheet);
        local chat = minhaMesa.chat;
        local nick = minhaMesa.meuJogador.nick

        node = ndb.getParent(ndb.getParent(sheet))

        local function definirEscola()
        if sheet.escola == 'Adivinhação' then
        return node.C_ADI_Total
        elseif sheet.escola == 'Azaração' then
        return node.C_AZA_Total
        elseif sheet.escola == 'Contra-Feitiço' then
        return node.C_CON_Total
        elseif sheet.escola == 'Encantamento' then
        return node.C_ENC_Total
        elseif sheet.escola == 'Feitiço' then
        return node.C_FEI_Total
        elseif sheet.escola == 'Transmutação' then
        return node.C_TRA_Total
        elseif sheet.escola == 'Arte das Trevas' then
        return node.C_MAL_Total
        end

        end

        local function stats()
        local msg = ""

        if sheet.Grad then
        msg = msg .. "[§K10]" .. "Grad: " .. "[§K1]" .. sheet.Grad
        end

        if sheet.CD then
        msg = msg .. "[§K10]" .. " CD: " .. "[§K1]" .. sheet.CD
        end

        if sheet.Dano then
        msg = msg .. "[§K10]" .. " Dano: " .. "[§K1]" .. sheet.Dano
        end

        if sheet.Poder then
        msg = msg .. "[§K10]" .. " Poder: " .. "[§K1]" .. sheet.Poder
        end

        if sheet.Bonus then
        msg = msg .. "[§K10]" .. " Bonus: " .. "[§K1]" .. sheet.Bonus
        end

        if sheet.Range then
        msg = msg .. "[§K10]" .. " Range: " .. "[§K1]" .. sheet.Range
        end

        if sheet.Area then
        msg = msg .. "[§K10]" .. " Area: " .. "[§K1]" .. sheet.Area
        end

        if sheet.Duracao then
        msg = msg .. "[§K10]" .. " Duração: " .. "[§K1]" .. sheet.Duracao
        end

        return msg
        end

        local somatoria = sheet.Grad .. "+" .. math.floor(definirEscola() / 2) .. "+" ..
        (node.concentracao or 0) .. (sheet.ext_Penalidade == nil and 0 or "-" .. sheet.ext_Penalidade)

        chat:enviarMensagem("----------------");

        chat:rolarDados("1d20+" .. somatoria, "Cast " .. sheet.nome .. " CD " .. sheet.CD, function
        (rolagem)

        chat:enviarMensagem("[§K10]" .. nick .. "[§K1] esta usando [§K6]" .. sheet.nome)


        if rolagem.resultado >= tonumber(sheet.CD) then
        chat:enviarMensagem("[§K9]Sucesso!");

        chat:enviarMensagem("[§K6]" .. sheet.nome .. " " .. stats())

        if sheet.Efeito then
        chat:enviarMensagem("[§K10]Efeito: " .. "[§K1]" .. sheet.Efeito)
        end

        if sheet.extra ~= 0 and sheet.extra ~= nil then
        chat:enviarMensagem("[§K8]Extra: " .. "[§K1]" .. sheet.extra)
        end

        if sheet.tipo == 'Ataque' then
        chat:rolarDados("1d20+" .. sheet.Grad .. "+" .. node.DES .. "+" .. (node.acerto or 0),
        "Ataque de " .. sheet.nome)
        elseif sheet.tipo == 'Defesa' then
        chat:rolarDados("1d8+" .. sheet.Poder .. "+" .. sheet.Bonus, "CA " .. sheet.nome)

        end

        chat:enviarMensagem("----------------");

        elseif rolagem.resultado < tonumber(sheet.CD) and rolagem.resultado > tonumber(sheet.CD)
        - 5 then
        chat:enviarMensagem(sheet.nome .. "[§K4] Falhou em 1 Estagio!!");

        elseif rolagem.resultado < tonumber(sheet.CD) and rolagem.resultado > tonumber(sheet.CD)
        - 10 then
        chat:enviarMensagem(sheet.nome .. "[§K4] Falhou em 2 Estagio!!");

        elseif rolagem.resultado < tonumber(sheet.CD) and rolagem.resultado > tonumber(sheet.CD)
        - 15 then
        chat:enviarMensagem(sheet.nome .. "[§K4] Falhou em 3 Estagio!!");

        else chat:enviarMensagem(sheet.nome .. "[§K4] Falhou em 4 Estagio!!");

        end

        end)


        end

        -- FUNÇÂO DE FEITICO

        local function ListaDeFeitico()
        require("ndb.lua");
        require("utils.lua");

        local Raiz = ndb.load("listfetico.xml");
        local Filho = ndb.getChildNodes(Raiz);

        ListaFeiticos = {} -- new array
        ListaNomesFeitico = {} -- new array

        for i = 1, #Filho, 1 do
        ListaFeiticos[i] = Raiz["f" .. i]
        ListaNomesFeitico[i] = Raiz["f" .. i].nome
        end

        Dialogs.choose("Selecione uma das opções", ListaNomesFeitico,
        function(selected, selectedIndex, selectedText)

        if selected then

        for k = 1, #Filho, 1 do

        if tostring(selectedText) == ListaFeiticos[k].nome then
        sheet.nome = ListaFeiticos[k].nome
        sheet.escola = ListaFeiticos[k].escola
        sheet.tipo = ListaFeiticos[k].cast
        sheet.Grad = ListaFeiticos[k].grad
        sheet.CD = ListaFeiticos[k].cdf
        sheet.Efeito = ListaFeiticos[k].efeito
        sheet.Poder = ListaFeiticos[k].poder
        sheet.Dano = ListaFeiticos[k].dano
        sheet.Bonus = ListaFeiticos[k].bonus
        sheet.Range = ListaFeiticos[k].range
        sheet.Area = ListaFeiticos[k].area
        sheet.Duracao = ListaFeiticos[k].duracao
        end

        end

        else

        end;

        end)


        end


    


    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'ext_Penalidade'});
    obj.dataLink1:setName("dataLink1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(50);
    obj.layout1:setName("layout1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setAlign("left");
    obj.layout2:setMargins({left=10});
    obj.layout2:setWidth(150);
    obj.layout2:setName("layout2");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout2);
    obj.rectangle1:setTop(7);
    obj.rectangle1:setLeft(7);
    obj.rectangle1:setColor("DarkSlateBlue");
    obj.rectangle1:setWidth(120);
    obj.rectangle1:setHeight(20);
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setAlign("client");
    obj.label1:setText("Feitiço");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setTop(27);
    obj.edit1:setWidth(150);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nome");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setAlign("left");
    obj.layout3:setMargins({left=10});
    obj.layout3:setWidth(80);
    obj.layout3:setName("layout3");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout3);
    obj.rectangle2:setTop(7);
    obj.rectangle2:setLeft(7);
    obj.rectangle2:setColor("DarkRed");
    obj.rectangle2:setWidth(65);
    obj.rectangle2:setHeight(20);
    obj.rectangle2:setName("rectangle2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle2);
    obj.label2:setAlign("client");
    obj.label2:setText("Debuff");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setTop(27);
    obj.edit2:setWidth(80);
    obj.edit2:setHeight(25);
    obj.edit2:setField("ext_Penalidade");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setAlign("left");
    obj.layout4:setMargins({left=10});
    obj.layout4:setWidth(80);
    obj.layout4:setName("layout4");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout4);
    obj.rectangle3:setTop(7);
    obj.rectangle3:setLeft(7);
    obj.rectangle3:setColor("DarkGreen");
    obj.rectangle3:setWidth(65);
    obj.rectangle3:setHeight(20);
    obj.rectangle3:setName("rectangle3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle3);
    obj.label3:setAlign("client");
    obj.label3:setText("Buff");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout4);
    obj.edit3:setTop(27);
    obj.edit3:setWidth(80);
    obj.edit3:setHeight(25);
    obj.edit3:setField("extra");
    obj.edit3:setReadOnly(true);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setAlign("left");
    obj.button1:setMargins({left=10});
    obj.button1:setText("Rolar");
    obj.button1:setName("button1");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.extra = math.floor((sheet.ext_Penalidade or 0) / 2)
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (_, event)
            enviarNaMesa()
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

        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfeiticosFacil()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_feiticosFacil();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _feiticosFacil = {
    newEditor = newfeiticosFacil, 
    new = newfeiticosFacil, 
    name = "feiticosFacil", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

feiticosFacil = _feiticosFacil;
Firecast.registrarForm(_feiticosFacil);

return _feiticosFacil;
