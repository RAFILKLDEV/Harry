require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_feiticos()
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
    obj:setName("feiticos");
    obj:setWidth(600);
    obj:setHeight(170);
    obj:setMargins({top=2,bottom=2});


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

        if sheet.nome == ListaFeiticos[k].nome then

        node.escola2 = ListaFeiticos[k].escola
        node.tipo2 = ListaFeiticos[k].cast
        node.Efeito2 = ListaFeiticos[k].efeito
        node.Grad2 = totable(ListaFeiticos[k].gradArray)[1]
        node.CD2 = totable(ListaFeiticos[k].cdfArray)[1]
        node.Dano2 = totable(ListaFeiticos[k].danoArray)[1]
        node.Poder2 = totable(ListaFeiticos[k].poderArray)[1]
        node.Range2 = totable(ListaFeiticos[k].rangeArray)[1]
        node.Area2 = totable(ListaFeiticos[k].areaArray)[1]
        node.Duracao2 = totable(ListaFeiticos[k].duracaoArray)[1]

        node.escola = sheet.escola
        node.tipo = sheet.tipo
        node.Grad = sheet.Grad
        node.CD = sheet.CD
        node.Dano = sheet.Dano
        node.Poder = sheet.Poder
        node.Range = sheet.Range
        node.Area = sheet.Area
        node.Duracao = sheet.escola

        node.Desc = ListaFeiticos[k].desc
        node.Efeito = ListaFeiticos[k].efeito
        node.Bonus = ListaFeiticos[k].bonus

        end
        end

        end

        local function condition(tipo)

        if tipo == "fisico" then

        if node.Exausto then
        return -5
        end

        if node.Fadigado then
        return -2
        end

        elseif tipo == "mental" then

        if node.Tiltado then
        return -5
        end

        if node.Frustrado then
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
        NDB.deleteNode(sheet);
        else
        return
        end;
        end);

        end

        local function enviarNaMesa()

        local minhaMesa = Firecast.getRoomOf(sheet);
        local chat = minhaMesa.chat;
        local nick = minhaMesa.meuJogador.nick

        node = NDB.getParent(NDB.getParent(sheet))

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
        elseif sheet.escola == 'Maldição' then
        return node.C_MAL_Total
        end

        end

        local function stats()
        local msg = ""

        if sheet.Grad ~= "" then
        msg = msg .. "[§K10]" .. "Grad: " .. "[§K1]" .. sheet.Grad
        else
        end

        if sheet.CD ~= "" then
        msg = msg .. "[§K10]" .. " CD: " .. "[§K1]" .. sheet.CD
        else
        end

        if sheet.Dano ~= "" then
        msg = msg .. "[§K10]" .. " Dano: " .. "[§K1]" .. sheet.Dano
        else
        end

        if sheet.Poder ~= "" then
        msg = msg .. "[§K10]" .. " Poder: " .. "[§K1]" .. sheet.Poder
        else
        end

        if sheet.Bonus ~= "" then
        msg = msg .. "[§K10]" .. " Bonus: " .. "[§K1]" .. sheet.Bonus
        else
        end

        if sheet.Range ~= "" then
        msg = msg .. "[§K10]" .. " Range: " .. "[§K1]" .. sheet.Range
        else
        end

        if sheet.Area ~= "" then
        msg = msg .. "[§K10]" .. " Area: " .. "[§K1]" .. sheet.Area
        else
        end

        if sheet.Duracao ~= "" then
        msg = msg .. "[§K10]" .. " Duração: " .. "[§K1]" .. sheet.Duracao
        else
        end

        return msg
        end

        local somatoria = sheet.Grad .. "+" .. math.floor(definirEscola() / 2) .. "-" ..
        (node.concentracao or 0)

        chat:enviarMensagem("----------------");

        chat:rolarDados("1d20+" .. somatoria .. (condition("mental") and (condition("mental")) or
        ""), "Cast " ..
        sheet.nome .. " CD " .. sheet.CD, function
        (rolagem)

        if rolagem.resultado >= tonumber(sheet.CD) then
        chat:enviarMensagem("[§K10]" .. nick .. "[§K1] esta castando [§K6]" .. sheet.nome  ..  "[§K9] Sucesso!")

        chat:enviarMensagem("[§K6]" .. sheet.nome .. " " .. stats())

        if sheet.Efeito then
        chat:enviarMensagem("[§K10]Efeito: " .. "[§K1]" .. sheet.Efeito)
        end

        if sheet.tipo == 'Ataque' then
        chat:rolarDados("1d20+" .. sheet.Grad .. "+" .. node.DES .. "-" .. (node.acerto or 0) ..
        (condition("fisico") and (condition("fisico")) or""),
        "Ataque de " .. sheet.nome)
        setTimeout(tocarAudio, 5000)

        elseif sheet.tipo == 'Defesa' then
        chat:rolarDados("1d8+" .. sheet.Poder .. "+" .. sheet.Bonus ..
        (condition("fisico") and (condition("fisico")) or ""), "CA " .. sheet.nome)
        setTimeout(tocarAudio, 5000)
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
        require("utils.lua");
        local Raiz = NDB.load("listfetico.xml");
        local Filho = NDB.getChildNodes(Raiz);
        local node = NDB.getRoot(sheet)

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
        sheet.tipo = ListaFeiticos[k].cast
        sheet.Efeito = ListaFeiticos[k].efeito

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

        end
        end
        else
        end;
        end)
        end

    


    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setName("layout1");

    obj.rectangle = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle:setParent(obj);
    obj.rectangle:setName("rectangle");
    obj.rectangle:setColor("grey");
    obj.rectangle:setOpacity(0.35);
    obj.rectangle:setWidth(1020);
    obj.rectangle:setHeight(170);

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj);
    obj.layout2:setAlign("left");
    obj.layout2:setMargins({left=10});
    obj.layout2:setWidth(180);
    obj.layout2:setName("layout2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setAlign("top");
    obj.label1:setMargins({left=75,top=5});
    obj.label1:setText("Nome");
    obj.label1:setName("label1");

    obj.nomeFeitico = GUI.fromHandle(_obj_newObject("edit"));
    obj.nomeFeitico:setParent(obj.layout2);
    obj.nomeFeitico:setName("nomeFeitico");
    lfm_setPropAsString(obj.nomeFeitico, "fontStyle", "bold italic");
    obj.nomeFeitico:setFontSize(15);
    obj.nomeFeitico:setHorzTextAlign("center");
    obj.nomeFeitico:setAlign("top");
    obj.nomeFeitico:setField("nome");
    obj.nomeFeitico:setHitTest(true);

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setAlign("top");
    obj.label2:setMargins({left=75,top=5});
    obj.label2:setText("Escola");
    obj.label2:setName("label2");

    obj.escola = GUI.fromHandle(_obj_newObject("edit"));
    obj.escola:setParent(obj.layout2);
    obj.escola:setName("escola");
    obj.escola:setHorzTextAlign("center");
    lfm_setPropAsString(obj.escola, "fontStyle", "bold italic");
    obj.escola:setAlign("top");
    obj.escola:setReadOnly(true);
    obj.escola:setField("escola");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout2);
    obj.label4:setAlign("top");
    obj.label4:setMargins({left=75,top=8});
    obj.label4:setText("Ação");
    obj.label4:setName("label4");

    obj.tipo = GUI.fromHandle(_obj_newObject("edit"));
    obj.tipo:setParent(obj.layout2);
    obj.tipo:setName("tipo");
    obj.tipo:setHorzTextAlign("center");
    lfm_setPropAsString(obj.tipo, "fontStyle", "bold italic");
    obj.tipo:setAlign("top");
    obj.tipo:setReadOnly(true);
    obj.tipo:setField("tipo");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(400);
    obj.layout3:setName("layout3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout3);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(55);
    obj.layout4:setName("layout4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout4);
    obj.layout5:setAlign("left");
    obj.layout5:setMargins({left=10});
    obj.layout5:setWidth(120);
    obj.layout5:setName("layout5");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout5);
    obj.rectangle1:setTop(7);
    obj.rectangle1:setLeft(7);
    obj.rectangle1:setColor("DarkSlateBlue");
    obj.rectangle1:setWidth(105);
    obj.rectangle1:setHeight(20);
    obj.rectangle1:setName("rectangle1");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle1);
    obj.label5:setAlign("client");
    obj.label5:setText("Grad");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout5);
    obj.layout6:setTop(27);
    obj.layout6:setWidth(120);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout6);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(120);
    obj.edit1:setHeight(25);
    obj.edit1:setField("Grad .. _name");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout6);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(120);
    obj.edit2:setHeight(25);
    obj.edit2:setField("Grad .. _array");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout6);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(120);
    obj.edit3:setHeight(25);
    obj.edit3:setField("Grad .. _grad");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");

    obj.Grad = GUI.fromHandle(_obj_newObject("edit"));
    obj.Grad:setParent(obj.layout6);
    obj.Grad:setName("Grad");
    obj.Grad:setTop(0);
    obj.Grad:setWidth(120);
    obj.Grad:setHeight(25);
    obj.Grad:setField("Grad");
    obj.Grad:setHorzTextAlign("center");
    obj.Grad:setHitTest(true);
    obj.Grad:setHint("");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout6);
    obj.button1:setText("-");
    obj.button1:setAlign("left");
    obj.button1:setWidth(20);
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout6);
    obj.button2:setText("+");
    obj.button2:setAlign("right");
    obj.button2:setWidth(20);
    obj.button2:setName("button2");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout4);
    obj.layout7:setAlign("left");
    obj.layout7:setMargins({left=10});
    obj.layout7:setWidth(120);
    obj.layout7:setName("layout7");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout7);
    obj.rectangle2:setTop(7);
    obj.rectangle2:setLeft(7);
    obj.rectangle2:setColor("DarkSlateBlue");
    obj.rectangle2:setWidth(105);
    obj.rectangle2:setHeight(20);
    obj.rectangle2:setName("rectangle2");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle2);
    obj.label6:setAlign("client");
    obj.label6:setText("CD");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout7);
    obj.layout8:setTop(27);
    obj.layout8:setWidth(120);
    obj.layout8:setHeight(25);
    obj.layout8:setName("layout8");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout8);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(120);
    obj.edit4:setHeight(25);
    obj.edit4:setField("CD .. _name");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setName("edit4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout8);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(120);
    obj.edit5:setHeight(25);
    obj.edit5:setField("CD .. _array");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout8);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(120);
    obj.edit6:setHeight(25);
    obj.edit6:setField("CD .. _grad");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setName("edit6");

    obj.CD = GUI.fromHandle(_obj_newObject("edit"));
    obj.CD:setParent(obj.layout8);
    obj.CD:setName("CD");
    obj.CD:setTop(0);
    obj.CD:setWidth(120);
    obj.CD:setHeight(25);
    obj.CD:setField("CD");
    obj.CD:setHorzTextAlign("center");
    obj.CD:setHitTest(true);
    obj.CD:setHint("");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout8);
    obj.button3:setText("-");
    obj.button3:setAlign("left");
    obj.button3:setWidth(20);
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout8);
    obj.button4:setText("+");
    obj.button4:setAlign("right");
    obj.button4:setWidth(20);
    obj.button4:setName("button4");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout4);
    obj.layout9:setAlign("left");
    obj.layout9:setMargins({left=10});
    obj.layout9:setWidth(120);
    obj.layout9:setName("layout9");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout9);
    obj.rectangle3:setTop(7);
    obj.rectangle3:setLeft(7);
    obj.rectangle3:setColor("DarkSlateBlue");
    obj.rectangle3:setWidth(105);
    obj.rectangle3:setHeight(20);
    obj.rectangle3:setName("rectangle3");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle3);
    obj.label7:setAlign("client");
    obj.label7:setText("Efeito");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout9);
    obj.layout10:setTop(27);
    obj.layout10:setWidth(120);
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout10);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(120);
    obj.edit7:setHeight(25);
    obj.edit7:setField("Efeito .. _name");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setName("edit7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout10);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(120);
    obj.edit8:setHeight(25);
    obj.edit8:setField("Efeito .. _array");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout10);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(120);
    obj.edit9:setHeight(25);
    obj.edit9:setField("Efeito .. _grad");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setName("edit9");

    obj.Efeito = GUI.fromHandle(_obj_newObject("edit"));
    obj.Efeito:setParent(obj.layout10);
    obj.Efeito:setName("Efeito");
    obj.Efeito:setTop(0);
    obj.Efeito:setWidth(120);
    obj.Efeito:setHeight(25);
    obj.Efeito:setField("Efeito");
    obj.Efeito:setHorzTextAlign("center");
    obj.Efeito:setHitTest(true);
    obj.Efeito:setHint("");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout10);
    obj.button5:setText("-");
    obj.button5:setAlign("left");
    obj.button5:setWidth(20);
    obj.button5:setName("button5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout10);
    obj.button6:setText("+");
    obj.button6:setAlign("right");
    obj.button6:setWidth(20);
    obj.button6:setName("button6");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout3);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(55);
    obj.layout11:setName("layout11");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout11);
    obj.layout12:setAlign("left");
    obj.layout12:setMargins({left=10});
    obj.layout12:setWidth(120);
    obj.layout12:setName("layout12");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout12);
    obj.rectangle4:setTop(7);
    obj.rectangle4:setLeft(7);
    obj.rectangle4:setColor("DarkSlateBlue");
    obj.rectangle4:setWidth(105);
    obj.rectangle4:setHeight(20);
    obj.rectangle4:setName("rectangle4");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle4);
    obj.label8:setAlign("client");
    obj.label8:setText("Poder");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout12);
    obj.layout13:setTop(27);
    obj.layout13:setWidth(120);
    obj.layout13:setHeight(25);
    obj.layout13:setName("layout13");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout13);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(120);
    obj.edit10:setHeight(25);
    obj.edit10:setField("Poder .. _name");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout13);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(120);
    obj.edit11:setHeight(25);
    obj.edit11:setField("Poder .. _array");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setName("edit11");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout13);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(120);
    obj.edit12:setHeight(25);
    obj.edit12:setField("Poder .. _grad");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setName("edit12");

    obj.Poder = GUI.fromHandle(_obj_newObject("edit"));
    obj.Poder:setParent(obj.layout13);
    obj.Poder:setName("Poder");
    obj.Poder:setTop(0);
    obj.Poder:setWidth(120);
    obj.Poder:setHeight(25);
    obj.Poder:setField("Poder");
    obj.Poder:setHorzTextAlign("center");
    obj.Poder:setHitTest(true);
    obj.Poder:setHint("");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout13);
    obj.button7:setText("-");
    obj.button7:setAlign("left");
    obj.button7:setWidth(20);
    obj.button7:setName("button7");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout13);
    obj.button8:setText("+");
    obj.button8:setAlign("right");
    obj.button8:setWidth(20);
    obj.button8:setName("button8");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout11);
    obj.layout14:setAlign("left");
    obj.layout14:setMargins({left=10});
    obj.layout14:setWidth(120);
    obj.layout14:setName("layout14");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout14);
    obj.rectangle5:setTop(7);
    obj.rectangle5:setLeft(7);
    obj.rectangle5:setColor("DarkSlateBlue");
    obj.rectangle5:setWidth(105);
    obj.rectangle5:setHeight(20);
    obj.rectangle5:setName("rectangle5");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle5);
    obj.label9:setAlign("client");
    obj.label9:setText("Dano");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout14);
    obj.layout15:setTop(27);
    obj.layout15:setWidth(120);
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout15);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(120);
    obj.edit13:setHeight(25);
    obj.edit13:setField("Dano .. _name");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setName("edit13");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout15);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(120);
    obj.edit14:setHeight(25);
    obj.edit14:setField("Dano .. _array");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout15);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(120);
    obj.edit15:setHeight(25);
    obj.edit15:setField("Dano .. _grad");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setName("edit15");

    obj.Dano = GUI.fromHandle(_obj_newObject("edit"));
    obj.Dano:setParent(obj.layout15);
    obj.Dano:setName("Dano");
    obj.Dano:setTop(0);
    obj.Dano:setWidth(120);
    obj.Dano:setHeight(25);
    obj.Dano:setField("Dano");
    obj.Dano:setHorzTextAlign("center");
    obj.Dano:setHitTest(true);
    obj.Dano:setHint("");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout15);
    obj.button9:setText("-");
    obj.button9:setAlign("left");
    obj.button9:setWidth(20);
    obj.button9:setName("button9");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout15);
    obj.button10:setText("+");
    obj.button10:setAlign("right");
    obj.button10:setWidth(20);
    obj.button10:setName("button10");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout11);
    obj.layout16:setAlign("left");
    obj.layout16:setMargins({left=10});
    obj.layout16:setWidth(120);
    obj.layout16:setName("layout16");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout16);
    obj.rectangle6:setTop(7);
    obj.rectangle6:setLeft(7);
    obj.rectangle6:setColor("DarkSlateBlue");
    obj.rectangle6:setWidth(105);
    obj.rectangle6:setHeight(20);
    obj.rectangle6:setName("rectangle6");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle6);
    obj.label10:setAlign("client");
    obj.label10:setText("Bonus");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout16);
    obj.layout17:setTop(27);
    obj.layout17:setWidth(120);
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout17);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(120);
    obj.edit16:setHeight(25);
    obj.edit16:setField("Bonus .. _name");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout17);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(120);
    obj.edit17:setHeight(25);
    obj.edit17:setField("Bonus .. _array");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout17);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(120);
    obj.edit18:setHeight(25);
    obj.edit18:setField("Bonus .. _grad");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setName("edit18");

    obj.Bonus = GUI.fromHandle(_obj_newObject("edit"));
    obj.Bonus:setParent(obj.layout17);
    obj.Bonus:setName("Bonus");
    obj.Bonus:setTop(0);
    obj.Bonus:setWidth(120);
    obj.Bonus:setHeight(25);
    obj.Bonus:setField("Bonus");
    obj.Bonus:setHorzTextAlign("center");
    obj.Bonus:setHitTest(true);
    obj.Bonus:setHint("");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout17);
    obj.button11:setText("-");
    obj.button11:setAlign("left");
    obj.button11:setWidth(20);
    obj.button11:setName("button11");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout17);
    obj.button12:setText("+");
    obj.button12:setAlign("right");
    obj.button12:setWidth(20);
    obj.button12:setName("button12");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout3);
    obj.layout18:setAlign("top");
    obj.layout18:setHeight(55);
    obj.layout18:setName("layout18");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout18);
    obj.layout19:setAlign("left");
    obj.layout19:setMargins({left=10});
    obj.layout19:setWidth(120);
    obj.layout19:setName("layout19");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout19);
    obj.rectangle7:setTop(7);
    obj.rectangle7:setLeft(7);
    obj.rectangle7:setColor("DarkSlateBlue");
    obj.rectangle7:setWidth(105);
    obj.rectangle7:setHeight(20);
    obj.rectangle7:setName("rectangle7");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle7);
    obj.label11:setAlign("client");
    obj.label11:setText("Range");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout19);
    obj.layout20:setTop(27);
    obj.layout20:setWidth(120);
    obj.layout20:setHeight(25);
    obj.layout20:setName("layout20");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout20);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(120);
    obj.edit19:setHeight(25);
    obj.edit19:setField("Range .. _name");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setName("edit19");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout20);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(120);
    obj.edit20:setHeight(25);
    obj.edit20:setField("Range .. _array");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setName("edit20");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout20);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(120);
    obj.edit21:setHeight(25);
    obj.edit21:setField("Range .. _grad");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setName("edit21");

    obj.Range = GUI.fromHandle(_obj_newObject("edit"));
    obj.Range:setParent(obj.layout20);
    obj.Range:setName("Range");
    obj.Range:setTop(0);
    obj.Range:setWidth(120);
    obj.Range:setHeight(25);
    obj.Range:setField("Range");
    obj.Range:setHorzTextAlign("center");
    obj.Range:setHitTest(true);
    obj.Range:setHint("");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout20);
    obj.button13:setText("-");
    obj.button13:setAlign("left");
    obj.button13:setWidth(20);
    obj.button13:setName("button13");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout20);
    obj.button14:setText("+");
    obj.button14:setAlign("right");
    obj.button14:setWidth(20);
    obj.button14:setName("button14");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout18);
    obj.layout21:setAlign("left");
    obj.layout21:setMargins({left=10});
    obj.layout21:setWidth(120);
    obj.layout21:setName("layout21");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout21);
    obj.rectangle8:setTop(7);
    obj.rectangle8:setLeft(7);
    obj.rectangle8:setColor("DarkSlateBlue");
    obj.rectangle8:setWidth(105);
    obj.rectangle8:setHeight(20);
    obj.rectangle8:setName("rectangle8");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle8);
    obj.label12:setAlign("client");
    obj.label12:setText("Area");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout21);
    obj.layout22:setTop(27);
    obj.layout22:setWidth(120);
    obj.layout22:setHeight(25);
    obj.layout22:setName("layout22");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout22);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(120);
    obj.edit22:setHeight(25);
    obj.edit22:setField("Area .. _name");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setName("edit22");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout22);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(120);
    obj.edit23:setHeight(25);
    obj.edit23:setField("Area .. _array");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setName("edit23");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout22);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(120);
    obj.edit24:setHeight(25);
    obj.edit24:setField("Area .. _grad");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setName("edit24");

    obj.Area = GUI.fromHandle(_obj_newObject("edit"));
    obj.Area:setParent(obj.layout22);
    obj.Area:setName("Area");
    obj.Area:setTop(0);
    obj.Area:setWidth(120);
    obj.Area:setHeight(25);
    obj.Area:setField("Area");
    obj.Area:setHorzTextAlign("center");
    obj.Area:setHitTest(true);
    obj.Area:setHint("");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout22);
    obj.button15:setText("-");
    obj.button15:setAlign("left");
    obj.button15:setWidth(20);
    obj.button15:setName("button15");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout22);
    obj.button16:setText("+");
    obj.button16:setAlign("right");
    obj.button16:setWidth(20);
    obj.button16:setName("button16");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout18);
    obj.layout23:setAlign("left");
    obj.layout23:setMargins({left=10});
    obj.layout23:setWidth(120);
    obj.layout23:setName("layout23");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout23);
    obj.rectangle9:setTop(7);
    obj.rectangle9:setLeft(7);
    obj.rectangle9:setColor("DarkSlateBlue");
    obj.rectangle9:setWidth(105);
    obj.rectangle9:setHeight(20);
    obj.rectangle9:setName("rectangle9");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle9);
    obj.label13:setAlign("client");
    obj.label13:setText("Duração");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout23);
    obj.layout24:setTop(27);
    obj.layout24:setWidth(120);
    obj.layout24:setHeight(25);
    obj.layout24:setName("layout24");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout24);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(120);
    obj.edit25:setHeight(25);
    obj.edit25:setField("Duracao .. _name");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setName("edit25");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout24);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(120);
    obj.edit26:setHeight(25);
    obj.edit26:setField("Duracao .. _array");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setName("edit26");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout24);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(120);
    obj.edit27:setHeight(25);
    obj.edit27:setField("Duracao .. _grad");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setName("edit27");

    obj.Duracao = GUI.fromHandle(_obj_newObject("edit"));
    obj.Duracao:setParent(obj.layout24);
    obj.Duracao:setName("Duracao");
    obj.Duracao:setTop(0);
    obj.Duracao:setWidth(120);
    obj.Duracao:setHeight(25);
    obj.Duracao:setField("Duracao");
    obj.Duracao:setHorzTextAlign("center");
    obj.Duracao:setHitTest(true);
    obj.Duracao:setHint("");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout24);
    obj.button17:setText("-");
    obj.button17:setAlign("left");
    obj.button17:setWidth(20);
    obj.button17:setName("button17");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout24);
    obj.button18:setText("+");
    obj.button18:setAlign("right");
    obj.button18:setWidth(20);
    obj.button18:setName("button18");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj);
    obj.layout25:setWidth(50);
    obj.layout25:setAlign("left");
    obj.layout25:setName("layout25");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout25);
    obj.rectangle10:setTop(55);
    obj.rectangle10:setLeft(5);
    obj.rectangle10:setColor("purple");
    obj.rectangle10:setWidth(40);
    obj.rectangle10:setHeight(20);
    obj.rectangle10:setName("rectangle10");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectangle10);
    obj.label14:setAlign("client");
    obj.label14:setText("Order");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout25);
    obj.edit28:setTop(75);
    obj.edit28:setLeft(5);
    obj.edit28:setWidth(40);
    obj.edit28:setHeight(25);
    obj.edit28:setField("Order");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setHint("Quanto menor mais acima na lista!");
    obj.edit28:setName("edit28");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj);
    obj.layout26:setWidth(100);
    obj.layout26:setAlign("left");
    obj.layout26:setName("layout26");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout26);
    obj.button19:setAlign("top");
    obj.button19:setText("Rolar");
    obj.button19:setHeight(35);
    obj.button19:setMargins({bottom=5});
    obj.button19:setName("button19");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout26);
    obj.button20:setAlign("top");
    obj.button20:setText("Importar");
    obj.button20:setHeight(35);
    obj.button20:setMargins({bottom=5});
    obj.button20:setName("button20");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.layout26);
    obj.button21:setAlign("bottom");
    obj.button21:setText("Apagar");
    obj.button21:setHeight(35);
    obj.button21:setMargins({bottom=5});
    obj.button21:setName("button21");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.layout26);
    obj.button22:setAlign("bottom");
    obj.button22:setText("Comparar");
    obj.button22:setHeight(35);
    obj.button22:setName("button22");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function ()
            local campos = {"Grad","CD","Efeito","Poder","Dano","Bonus","Range","Area","Duracao"}
            
                    for x = 1, #campos, 1 do
            
                    if sheet[campos[x]] == nil then
                    sheet[campos[x]] = 0
                    end
            
                    end
            
                    if sheet.escola == nil then
                    self.escola.text = "Feitiço"
                    end
            
                    if sheet.tipo == nil then
                    self.tipo.text = "Cast"
                    end
            
                    if sheet.nome == nil then
                    sheet.nome = "Feitiço"
                    end
            
                    if sheet.Order == nil then
            
                    sheet.Order = 99
            
                    end
            
                    local function layoutFeitico()
            
                    if sheet.tipo == "Ataque" then
                    self.tipo.fontColor = "#FF0022"
                    elseif sheet.tipo == "Defesa" then
                    self.tipo.fontColor = "#53FF45"
                    elseif sheet.tipo == "Cast" then
                    self.tipo.fontColor = "#E8C547"
                    end
            
                    if sheet.escola == "Contra-Feitiço" then
                    self.escola.fontColor = "#EABFCB"
                    elseif sheet.escola == "Encantamento" then
                    self.escola.fontColor = "#2BD9FE"
                    elseif sheet.escola == "Feitiço" then
                    self.escola.fontColor = "#7765E3"
                    elseif sheet.escola == "Azaração" then
                    self.escola.fontColor = "#A1683A"
                    elseif sheet.escola == "Transmutação" then
                    self.escola.fontColor = "#E4572E"
                    elseif sheet.escola == "Maldição" then
                    self.escola.fontColor = "#32936F"
                    end
            
                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                    if sheet.Grad == tonumber(graduacoes) and self.rectangle then
                        self.rectangle.color = "gray"
                    elseif sheet.Grad > tonumber(graduacoes) then
                        self.rectangle.color = "green"
                    end
            
                    end
            
                    layoutFeitico()
        end);

    obj._e_event1 = obj.nomeFeitico:addEventListener("onMouseEnter",
        function ()
            self.nomeFeitico.hint = sheet.Desc or 0
        end);

    obj._e_event2 = obj.escola:addEventListener("onChange",
        function ()
            if sheet.escola == "Contra-Feitiço" then
                                self.escola.fontColor = "#EABFCB"
                            elseif sheet.escola == "Encantamento" then
                                self.escola.fontColor = "#2BD9FE"
                            elseif sheet.escola == "Feitiço" then
                                self.escola.fontColor = "#7765E3"
                            elseif sheet.escola == "Azaração" then
                                self.escola.fontColor = "#A1683A"
                            elseif sheet.escola == "Transmutação" then
                                self.escola.fontColor = "#E4572E"
                            elseif sheet.escola == "Maldição" then
                                self.escola.fontColor = "#32936F"    
                            end
        end);

    obj._e_event3 = obj.tipo:addEventListener("onChange",
        function ()
            if sheet.tipo == "Ataque" then
                            self.tipo.fontColor = "#FF0022"
                            elseif sheet.tipo == "Defesa" then
                            self.tipo.fontColor = "#53FF45"
                            elseif sheet.tipo == "Cast" then
                            self.tipo.fontColor = "#E8C547"
                            end
        end);

    obj._e_event4 = obj.edit3:addEventListener("onChange",
        function ()
        end);

    obj._e_event5 = obj.Grad:addEventListener("onMouseEnter",
        function ()
            self.Grad.hint = sheet.Grad
        end);

    obj._e_event6 = obj.button1:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Grad_array)
                                    local grad = tonumber(sheet.Grad_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                        if grad > 1 then
            
                                            result = result - 1
                                            sheet.Grad_grad = result
                                            sheet.Grad = array[result]
                                        
                                        end
            
                                    
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    end
        end);

    obj._e_event7 = obj.button2:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Grad_array)
                                    local grad = tonumber(sheet.Grad_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad > graduacoes then
            
                                        if grad < #array then
            
                                            result = result + 1
                                            sheet.Grad_grad = result
                                            sheet.Grad = array[result]
                                        
                                        end
            
                                    else 
                                    
                                    if sheet.Grad_name == "Grad" then
            
                                        result = result + 1
                                        sheet.Grad_grad = result
                                        sheet.Grad = array[result]
            
                                    end
                                    
            
                                    end
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    elseif sheet.Grad < tonumber(graduacoes) then
                                        self.rectangle.color = "red"
                                    end
        end);

    obj._e_event8 = obj.edit6:addEventListener("onChange",
        function ()
        end);

    obj._e_event9 = obj.CD:addEventListener("onMouseEnter",
        function ()
            self.CD.hint = sheet.CD
        end);

    obj._e_event10 = obj.button3:addEventListener("onClick",
        function (event)
            local array = totable(sheet.CD_array)
                                    local grad = tonumber(sheet.CD_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                        if grad > 1 then
            
                                            result = result - 1
                                            sheet.CD_grad = result
                                            sheet.CD = array[result]
                                        
                                        end
            
                                    
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    end
        end);

    obj._e_event11 = obj.button4:addEventListener("onClick",
        function (event)
            local array = totable(sheet.CD_array)
                                    local grad = tonumber(sheet.CD_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad > graduacoes then
            
                                        if grad < #array then
            
                                            result = result + 1
                                            sheet.CD_grad = result
                                            sheet.CD = array[result]
                                        
                                        end
            
                                    else 
                                    
                                    if sheet.CD_name == "Grad" then
            
                                        result = result + 1
                                        sheet.CD_grad = result
                                        sheet.CD = array[result]
            
                                    end
                                    
            
                                    end
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    elseif sheet.Grad < tonumber(graduacoes) then
                                        self.rectangle.color = "red"
                                    end
        end);

    obj._e_event12 = obj.edit9:addEventListener("onChange",
        function ()
        end);

    obj._e_event13 = obj.Efeito:addEventListener("onMouseEnter",
        function ()
            self.Efeito.hint = sheet.Efeito
        end);

    obj._e_event14 = obj.button5:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Efeito_array)
                                    local grad = tonumber(sheet.Efeito_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                        if grad > 1 then
            
                                            result = result - 1
                                            sheet.Efeito_grad = result
                                            sheet.Efeito = array[result]
                                        
                                        end
            
                                    
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    end
        end);

    obj._e_event15 = obj.button6:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Efeito_array)
                                    local grad = tonumber(sheet.Efeito_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad > graduacoes then
            
                                        if grad < #array then
            
                                            result = result + 1
                                            sheet.Efeito_grad = result
                                            sheet.Efeito = array[result]
                                        
                                        end
            
                                    else 
                                    
                                    if sheet.Efeito_name == "Grad" then
            
                                        result = result + 1
                                        sheet.Efeito_grad = result
                                        sheet.Efeito = array[result]
            
                                    end
                                    
            
                                    end
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    elseif sheet.Grad < tonumber(graduacoes) then
                                        self.rectangle.color = "red"
                                    end
        end);

    obj._e_event16 = obj.edit12:addEventListener("onChange",
        function ()
        end);

    obj._e_event17 = obj.Poder:addEventListener("onMouseEnter",
        function ()
            self.Poder.hint = sheet.Poder
        end);

    obj._e_event18 = obj.button7:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Poder_array)
                                    local grad = tonumber(sheet.Poder_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                        if grad > 1 then
            
                                            result = result - 1
                                            sheet.Poder_grad = result
                                            sheet.Poder = array[result]
                                        
                                        end
            
                                    
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    end
        end);

    obj._e_event19 = obj.button8:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Poder_array)
                                    local grad = tonumber(sheet.Poder_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad > graduacoes then
            
                                        if grad < #array then
            
                                            result = result + 1
                                            sheet.Poder_grad = result
                                            sheet.Poder = array[result]
                                        
                                        end
            
                                    else 
                                    
                                    if sheet.Poder_name == "Grad" then
            
                                        result = result + 1
                                        sheet.Poder_grad = result
                                        sheet.Poder = array[result]
            
                                    end
                                    
            
                                    end
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    elseif sheet.Grad < tonumber(graduacoes) then
                                        self.rectangle.color = "red"
                                    end
        end);

    obj._e_event20 = obj.edit15:addEventListener("onChange",
        function ()
        end);

    obj._e_event21 = obj.Dano:addEventListener("onMouseEnter",
        function ()
            self.Dano.hint = sheet.Dano
        end);

    obj._e_event22 = obj.button9:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Dano_array)
                                    local grad = tonumber(sheet.Dano_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                        if grad > 1 then
            
                                            result = result - 1
                                            sheet.Dano_grad = result
                                            sheet.Dano = array[result]
                                        
                                        end
            
                                    
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    end
        end);

    obj._e_event23 = obj.button10:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Dano_array)
                                    local grad = tonumber(sheet.Dano_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad > graduacoes then
            
                                        if grad < #array then
            
                                            result = result + 1
                                            sheet.Dano_grad = result
                                            sheet.Dano = array[result]
                                        
                                        end
            
                                    else 
                                    
                                    if sheet.Dano_name == "Grad" then
            
                                        result = result + 1
                                        sheet.Dano_grad = result
                                        sheet.Dano = array[result]
            
                                    end
                                    
            
                                    end
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    elseif sheet.Grad < tonumber(graduacoes) then
                                        self.rectangle.color = "red"
                                    end
        end);

    obj._e_event24 = obj.edit18:addEventListener("onChange",
        function ()
        end);

    obj._e_event25 = obj.Bonus:addEventListener("onMouseEnter",
        function ()
            self.Bonus.hint = sheet.Bonus
        end);

    obj._e_event26 = obj.button11:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Bonus_array)
                                    local grad = tonumber(sheet.Bonus_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                        if grad > 1 then
            
                                            result = result - 1
                                            sheet.Bonus_grad = result
                                            sheet.Bonus = array[result]
                                        
                                        end
            
                                    
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    end
        end);

    obj._e_event27 = obj.button12:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Bonus_array)
                                    local grad = tonumber(sheet.Bonus_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad > graduacoes then
            
                                        if grad < #array then
            
                                            result = result + 1
                                            sheet.Bonus_grad = result
                                            sheet.Bonus = array[result]
                                        
                                        end
            
                                    else 
                                    
                                    if sheet.Bonus_name == "Grad" then
            
                                        result = result + 1
                                        sheet.Bonus_grad = result
                                        sheet.Bonus = array[result]
            
                                    end
                                    
            
                                    end
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    elseif sheet.Grad < tonumber(graduacoes) then
                                        self.rectangle.color = "red"
                                    end
        end);

    obj._e_event28 = obj.edit21:addEventListener("onChange",
        function ()
        end);

    obj._e_event29 = obj.Range:addEventListener("onMouseEnter",
        function ()
            self.Range.hint = sheet.Range
        end);

    obj._e_event30 = obj.button13:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Range_array)
                                    local grad = tonumber(sheet.Range_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                        if grad > 1 then
            
                                            result = result - 1
                                            sheet.Range_grad = result
                                            sheet.Range = array[result]
                                        
                                        end
            
                                    
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    end
        end);

    obj._e_event31 = obj.button14:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Range_array)
                                    local grad = tonumber(sheet.Range_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad > graduacoes then
            
                                        if grad < #array then
            
                                            result = result + 1
                                            sheet.Range_grad = result
                                            sheet.Range = array[result]
                                        
                                        end
            
                                    else 
                                    
                                    if sheet.Range_name == "Grad" then
            
                                        result = result + 1
                                        sheet.Range_grad = result
                                        sheet.Range = array[result]
            
                                    end
                                    
            
                                    end
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    elseif sheet.Grad < tonumber(graduacoes) then
                                        self.rectangle.color = "red"
                                    end
        end);

    obj._e_event32 = obj.edit24:addEventListener("onChange",
        function ()
        end);

    obj._e_event33 = obj.Area:addEventListener("onMouseEnter",
        function ()
            self.Area.hint = sheet.Area
        end);

    obj._e_event34 = obj.button15:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Area_array)
                                    local grad = tonumber(sheet.Area_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                        if grad > 1 then
            
                                            result = result - 1
                                            sheet.Area_grad = result
                                            sheet.Area = array[result]
                                        
                                        end
            
                                    
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    end
        end);

    obj._e_event35 = obj.button16:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Area_array)
                                    local grad = tonumber(sheet.Area_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad > graduacoes then
            
                                        if grad < #array then
            
                                            result = result + 1
                                            sheet.Area_grad = result
                                            sheet.Area = array[result]
                                        
                                        end
            
                                    else 
                                    
                                    if sheet.Area_name == "Grad" then
            
                                        result = result + 1
                                        sheet.Area_grad = result
                                        sheet.Area = array[result]
            
                                    end
                                    
            
                                    end
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    elseif sheet.Grad < tonumber(graduacoes) then
                                        self.rectangle.color = "red"
                                    end
        end);

    obj._e_event36 = obj.edit27:addEventListener("onChange",
        function ()
        end);

    obj._e_event37 = obj.Duracao:addEventListener("onMouseEnter",
        function ()
            self.Duracao.hint = sheet.Duracao
        end);

    obj._e_event38 = obj.button17:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Duracao_array)
                                    local grad = tonumber(sheet.Duracao_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                        if grad > 1 then
            
                                            result = result - 1
                                            sheet.Duracao_grad = result
                                            sheet.Duracao = array[result]
                                        
                                        end
            
                                    
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    end
        end);

    obj._e_event39 = obj.button18:addEventListener("onClick",
        function (event)
            local array = totable(sheet.Duracao_array)
                                    local grad = tonumber(sheet.Duracao_grad)
                                    local result = grad
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                    (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad > graduacoes then
            
                                        if grad < #array then
            
                                            result = result + 1
                                            sheet.Duracao_grad = result
                                            sheet.Duracao = array[result]
                                        
                                        end
            
                                    else 
                                    
                                    if sheet.Duracao_name == "Grad" then
            
                                        result = result + 1
                                        sheet.Duracao_grad = result
                                        sheet.Duracao = array[result]
            
                                    end
                                    
            
                                    end
            
                                    local graduacoes = tonumber((sheet.CD_grad - 1) + (sheet.Poder_grad - 1 ) + (sheet.Dano_grad - 1) + (sheet.Range_grad - 1) + 
                                            (sheet.Area_grad - 1) + (sheet.Duracao_grad - 1))
            
                                    if sheet.Grad == tonumber(graduacoes) then
                                        self.rectangle.color = "gray"
                                    elseif sheet.Grad > tonumber(graduacoes) then
                                        self.rectangle.color = "green"
                                    elseif sheet.Grad < tonumber(graduacoes) then
                                        self.rectangle.color = "red"
                                    end
        end);

    obj._e_event40 = obj.button19:addEventListener("onClick",
        function (event)
            enviarNaMesa()
        end);

    obj._e_event41 = obj.button20:addEventListener("onClick",
        function (event)
            ListaDeFeitico()
        end);

    obj._e_event42 = obj.button21:addEventListener("onClick",
        function (event)
            Aceitar()
        end);

    obj._e_event43 = obj.button22:addEventListener("onClick",
        function (event)
            abrirPopUp()
        end);

    function obj:_releaseEvents()
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
        if self.Bonus ~= nil then self.Bonus:destroy(); self.Bonus = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.CD ~= nil then self.CD:destroy(); self.CD = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.Grad ~= nil then self.Grad:destroy(); self.Grad = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.Efeito ~= nil then self.Efeito:destroy(); self.Efeito = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.rectangle ~= nil then self.rectangle:destroy(); self.rectangle = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.escola ~= nil then self.escola:destroy(); self.escola = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.Range ~= nil then self.Range:destroy(); self.Range = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.Poder ~= nil then self.Poder:destroy(); self.Poder = nil; end;
        if self.Duracao ~= nil then self.Duracao:destroy(); self.Duracao = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.tipo ~= nil then self.tipo:destroy(); self.tipo = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.Dano ~= nil then self.Dano:destroy(); self.Dano = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.nomeFeitico ~= nil then self.nomeFeitico:destroy(); self.nomeFeitico = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.Area ~= nil then self.Area:destroy(); self.Area = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfeiticos()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_feiticos();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _feiticos = {
    newEditor = newfeiticos, 
    new = newfeiticos, 
    name = "feiticos", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "", 
    description=""};

feiticos = _feiticos;
Firecast.registrarForm(_feiticos);

return _feiticos;
