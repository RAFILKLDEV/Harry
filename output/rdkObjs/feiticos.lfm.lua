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

        local somatoria = sheet.Grad .. "+" .. math.floor(definirEscola() / 2) .. "-" ..
        (node.concentracao or 0)

        chat:enviarMensagem("----------------");

        chat:rolarDados("1d20+" .. somatoria .. (condition("mental") and (condition("mental")) or
        ""), "Cast " ..
        sheet.nome .. " CD " .. sheet.CD, function
        (rolagem)

        chat:enviarMensagem("[§K10]" .. nick .. "[§K1] esta usando [§K6]" .. sheet.nome)


        if rolagem.resultado >= tonumber(sheet.CD) then
        chat:enviarMensagem("[§K9]Sucesso!");

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

    


    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setColor("grey");
    obj.rectangle1:setOpacity(0.35);
    obj.rectangle1:setWidth(1020);
    obj.rectangle1:setHeight(170);
    obj.rectangle1:setName("rectangle1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("left");
    obj.layout1:setWidth(300);
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setAlign("top");
    obj.label1:setMargins({left=130,top=5});
    obj.label1:setText("Nome");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    lfm_setPropAsString(obj.edit1, "fontStyle", "bold italic");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setAlign("top");
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setAlign("top");
    obj.label2:setMargins({left=130,top=5});
    obj.label2:setText("Escola");
    obj.label2:setName("label2");

    obj.escola = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.escola:setParent(obj.layout1);
    obj.escola:setName("escola");
    obj.escola:setField("escola");
    obj.escola:setHorzTextAlign("center");
    obj.escola:setAlign("top");
    obj.escola:setHeight(30);
    obj.escola:setItems({'Adivinhação', 'Azaração', 'Contra-Feitiço', 'Encantamento','Feitiço','Transmutação', 'Arte das Trevas'});

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout1);
    obj.label4:setAlign("top");
    obj.label4:setMargins({left=130,top=5});
    obj.label4:setText("Ação");
    obj.label4:setName("label4");

    obj.tipo = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.tipo:setParent(obj.layout1);
    obj.tipo:setName("tipo");
    obj.tipo:setField("tipo");
    obj.tipo:setHorzTextAlign("center");
    obj.tipo:setAlign("top");
    obj.tipo:setHeight(30);
    obj.tipo:setItems({'Ataque', 'Defesa', 'Cast'});

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(270);
    obj.layout2:setName("layout2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(55);
    obj.layout3:setName("layout3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout3);
    obj.layout4:setAlign("left");
    obj.layout4:setMargins({left=10});
    obj.layout4:setWidth(80);
    obj.layout4:setName("layout4");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout4);
    obj.rectangle2:setTop(7);
    obj.rectangle2:setLeft(7);
    obj.rectangle2:setColor("DarkSlateBlue");
    obj.rectangle2:setWidth(65);
    obj.rectangle2:setHeight(20);
    obj.rectangle2:setName("rectangle2");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle2);
    obj.label5:setAlign("client");
    obj.label5:setText("Grad");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout4);
    obj.edit2:setTop(27);
    obj.edit2:setWidth(80);
    obj.edit2:setHeight(25);
    obj.edit2:setField("Grad");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout3);
    obj.layout5:setAlign("left");
    obj.layout5:setMargins({left=10});
    obj.layout5:setWidth(80);
    obj.layout5:setName("layout5");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout5);
    obj.rectangle3:setTop(7);
    obj.rectangle3:setLeft(7);
    obj.rectangle3:setColor("DarkSlateBlue");
    obj.rectangle3:setWidth(65);
    obj.rectangle3:setHeight(20);
    obj.rectangle3:setName("rectangle3");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle3);
    obj.label6:setAlign("client");
    obj.label6:setText("CD");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout5);
    obj.edit3:setTop(27);
    obj.edit3:setWidth(80);
    obj.edit3:setHeight(25);
    obj.edit3:setField("CD");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout3);
    obj.layout6:setAlign("left");
    obj.layout6:setMargins({left=10});
    obj.layout6:setWidth(80);
    obj.layout6:setName("layout6");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout6);
    obj.rectangle4:setTop(7);
    obj.rectangle4:setLeft(7);
    obj.rectangle4:setColor("DarkSlateBlue");
    obj.rectangle4:setWidth(65);
    obj.rectangle4:setHeight(20);
    obj.rectangle4:setName("rectangle4");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle4);
    obj.label7:setAlign("client");
    obj.label7:setText("Efeito");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout6);
    obj.edit4:setTop(27);
    obj.edit4:setWidth(80);
    obj.edit4:setHeight(25);
    obj.edit4:setField("Efeito");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setName("edit4");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout2);
    obj.layout7:setAlign("top");
    obj.layout7:setHeight(55);
    obj.layout7:setName("layout7");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout7);
    obj.layout8:setAlign("left");
    obj.layout8:setMargins({left=10});
    obj.layout8:setWidth(80);
    obj.layout8:setName("layout8");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout8);
    obj.rectangle5:setTop(7);
    obj.rectangle5:setLeft(7);
    obj.rectangle5:setColor("DarkSlateBlue");
    obj.rectangle5:setWidth(65);
    obj.rectangle5:setHeight(20);
    obj.rectangle5:setName("rectangle5");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle5);
    obj.label8:setAlign("client");
    obj.label8:setText("Poder");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout8);
    obj.edit5:setTop(27);
    obj.edit5:setWidth(80);
    obj.edit5:setHeight(25);
    obj.edit5:setField("Poder");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setName("edit5");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout7);
    obj.layout9:setAlign("left");
    obj.layout9:setMargins({left=10});
    obj.layout9:setWidth(80);
    obj.layout9:setName("layout9");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout9);
    obj.rectangle6:setTop(7);
    obj.rectangle6:setLeft(7);
    obj.rectangle6:setColor("DarkSlateBlue");
    obj.rectangle6:setWidth(65);
    obj.rectangle6:setHeight(20);
    obj.rectangle6:setName("rectangle6");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle6);
    obj.label9:setAlign("client");
    obj.label9:setText("Dano");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout9);
    obj.edit6:setTop(27);
    obj.edit6:setWidth(80);
    obj.edit6:setHeight(25);
    obj.edit6:setField("Dano");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setName("edit6");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout7);
    obj.layout10:setAlign("left");
    obj.layout10:setMargins({left=10});
    obj.layout10:setWidth(80);
    obj.layout10:setName("layout10");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout10);
    obj.rectangle7:setTop(7);
    obj.rectangle7:setLeft(7);
    obj.rectangle7:setColor("DarkSlateBlue");
    obj.rectangle7:setWidth(65);
    obj.rectangle7:setHeight(20);
    obj.rectangle7:setName("rectangle7");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle7);
    obj.label10:setAlign("client");
    obj.label10:setText("Bonus");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout10);
    obj.edit7:setTop(27);
    obj.edit7:setWidth(80);
    obj.edit7:setHeight(25);
    obj.edit7:setField("Bonus");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setName("edit7");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout2);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(55);
    obj.layout11:setName("layout11");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout11);
    obj.layout12:setAlign("left");
    obj.layout12:setMargins({left=10});
    obj.layout12:setWidth(80);
    obj.layout12:setName("layout12");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout12);
    obj.rectangle8:setTop(7);
    obj.rectangle8:setLeft(7);
    obj.rectangle8:setColor("DarkSlateBlue");
    obj.rectangle8:setWidth(65);
    obj.rectangle8:setHeight(20);
    obj.rectangle8:setName("rectangle8");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle8);
    obj.label11:setAlign("client");
    obj.label11:setText("Range");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout12);
    obj.edit8:setTop(27);
    obj.edit8:setWidth(80);
    obj.edit8:setHeight(25);
    obj.edit8:setField("Range");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setName("edit8");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout11);
    obj.layout13:setAlign("left");
    obj.layout13:setMargins({left=10});
    obj.layout13:setWidth(80);
    obj.layout13:setName("layout13");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout13);
    obj.rectangle9:setTop(7);
    obj.rectangle9:setLeft(7);
    obj.rectangle9:setColor("DarkSlateBlue");
    obj.rectangle9:setWidth(65);
    obj.rectangle9:setHeight(20);
    obj.rectangle9:setName("rectangle9");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle9);
    obj.label12:setAlign("client");
    obj.label12:setText("Area");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout13);
    obj.edit9:setTop(27);
    obj.edit9:setWidth(80);
    obj.edit9:setHeight(25);
    obj.edit9:setField("Area");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setName("edit9");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout11);
    obj.layout14:setAlign("left");
    obj.layout14:setMargins({left=10});
    obj.layout14:setWidth(80);
    obj.layout14:setName("layout14");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout14);
    obj.rectangle10:setTop(7);
    obj.rectangle10:setLeft(7);
    obj.rectangle10:setColor("DarkSlateBlue");
    obj.rectangle10:setWidth(65);
    obj.rectangle10:setHeight(20);
    obj.rectangle10:setName("rectangle10");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle10);
    obj.label13:setAlign("client");
    obj.label13:setText("Duração");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout14);
    obj.edit10:setTop(27);
    obj.edit10:setWidth(80);
    obj.edit10:setHeight(25);
    obj.edit10:setField("Duracao");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setName("edit10");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj);
    obj.layout15:setWidth(50);
    obj.layout15:setAlign("left");
    obj.layout15:setName("layout15");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout15);
    obj.rectangle11:setTop(55);
    obj.rectangle11:setLeft(5);
    obj.rectangle11:setColor("purple");
    obj.rectangle11:setWidth(40);
    obj.rectangle11:setHeight(20);
    obj.rectangle11:setName("rectangle11");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectangle11);
    obj.label14:setAlign("client");
    obj.label14:setText("Order");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout15);
    obj.edit11:setTop(75);
    obj.edit11:setLeft(5);
    obj.edit11:setWidth(40);
    obj.edit11:setHeight(25);
    obj.edit11:setField("Order");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setHint("Quanto menor mais acima na lista!");
    obj.edit11:setName("edit11");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj);
    obj.layout16:setWidth(100);
    obj.layout16:setAlign("left");
    obj.layout16:setName("layout16");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout16);
    obj.button1:setAlign("top");
    obj.button1:setText("Rolar");
    obj.button1:setHeight(35);
    obj.button1:setMargins({bottom=5});
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout16);
    obj.button2:setAlign("top");
    obj.button2:setText("Importar");
    obj.button2:setHeight(35);
    obj.button2:setMargins({bottom=5});
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout16);
    obj.button3:setAlign("bottom");
    obj.button3:setText("Apagar");
    obj.button3:setHeight(35);
    obj.button3:setMargins({bottom=5});
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout16);
    obj.button4:setAlign("bottom");
    obj.button4:setText("Comparar");
    obj.button4:setHeight(35);
    obj.button4:setName("button4");

    obj.popUp = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp:setParent(obj);
    obj.popUp:setName("popUp");
    obj.popUp:setWidth(306);
    obj.popUp:setHeight(360);
    obj.popUp:setBackOpacity(0.5);

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.popUp);
    obj.layout17:setAlign("left");
    obj.layout17:setWidth(200);
    obj.layout17:setName("layout17");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout17);
    obj.layout18:setAlign("top");
    obj.layout18:setHeight(30);
    obj.layout18:setName("layout18");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout18);
    obj.label15:setAlign("left");
    obj.label15:setWidth(100);
    obj.label15:setText("");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout18);
    obj.label16:setAlign("left");
    obj.label16:setWidth(100);
    obj.label16:setText("Original");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout17);
    obj.layout19:setAlign("top");
    obj.layout19:setHeight(400);
    obj.layout19:setName("layout19");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout19);
    obj.rectangle12:setAlign("left");
    obj.rectangle12:setWidth(100);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setName("rectangle12");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.rectangle12);
    obj.edit12:setTransparent(true);
    obj.edit12:setMargins({top=5,bottom=5});
    obj.edit12:setAlign("top");
    obj.edit12:setText("GRAD");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setName("edit12");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.rectangle12);
    obj.edit13:setTransparent(true);
    obj.edit13:setMargins({bottom=5});
    obj.edit13:setAlign("top");
    obj.edit13:setText("CD");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setName("edit13");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.rectangle12);
    obj.edit14:setTransparent(true);
    obj.edit14:setMargins({bottom=5});
    obj.edit14:setAlign("top");
    obj.edit14:setText("EFEITO");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.rectangle12);
    obj.edit15:setTransparent(true);
    obj.edit15:setMargins({bottom=5});
    obj.edit15:setAlign("top");
    obj.edit15:setText("PODER");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setName("edit15");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.rectangle12);
    obj.edit16:setTransparent(true);
    obj.edit16:setMargins({bottom=5});
    obj.edit16:setAlign("top");
    obj.edit16:setText("DANO");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.rectangle12);
    obj.edit17:setTransparent(true);
    obj.edit17:setMargins({bottom=5});
    obj.edit17:setAlign("top");
    obj.edit17:setText("BONUS");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.rectangle12);
    obj.edit18:setTransparent(true);
    obj.edit18:setMargins({bottom=5});
    obj.edit18:setAlign("top");
    obj.edit18:setText("RANGE");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.rectangle12);
    obj.edit19:setTransparent(true);
    obj.edit19:setMargins({bottom=5});
    obj.edit19:setAlign("top");
    obj.edit19:setText("AREA");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setName("edit19");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.rectangle12);
    obj.edit20:setTransparent(true);
    obj.edit20:setMargins({bottom=5});
    obj.edit20:setAlign("top");
    obj.edit20:setText("DURAÇÃO");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setName("edit20");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout19);
    obj.rectangle13:setAlign("left");
    obj.rectangle13:setWidth(100);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setName("rectangle13");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.rectangle13);
    obj.edit21:setMargins({top=5,bottom=5});
    obj.edit21:setAlign("top");
    obj.edit21:setField("Grad2");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setName("edit21");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.rectangle13);
    obj.edit22:setMargins({bottom=5});
    obj.edit22:setAlign("top");
    obj.edit22:setField("CD2");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setName("edit22");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.rectangle13);
    obj.edit23:setMargins({bottom=5});
    obj.edit23:setAlign("top");
    obj.edit23:setField("Efeito2");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setName("edit23");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.rectangle13);
    obj.edit24:setMargins({bottom=5});
    obj.edit24:setAlign("top");
    obj.edit24:setField("Poder2");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setName("edit24");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.rectangle13);
    obj.edit25:setMargins({bottom=5});
    obj.edit25:setAlign("top");
    obj.edit25:setField("Dano2");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setName("edit25");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.rectangle13);
    obj.edit26:setMargins({bottom=5});
    obj.edit26:setAlign("top");
    obj.edit26:setField("Bonus2");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setName("edit26");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.rectangle13);
    obj.edit27:setMargins({bottom=5});
    obj.edit27:setAlign("top");
    obj.edit27:setField("Range2");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setName("edit27");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.rectangle13);
    obj.edit28:setMargins({bottom=5});
    obj.edit28:setAlign("top");
    obj.edit28:setField("Area2");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setName("edit28");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.rectangle13);
    obj.edit29:setMargins({bottom=5});
    obj.edit29:setAlign("top");
    obj.edit29:setField("Duracao2");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setName("edit29");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.popUp);
    obj.layout20:setAlign("left");
    obj.layout20:setWidth(100);
    obj.layout20:setName("layout20");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout20);
    obj.label17:setAlign("top");
    obj.label17:setHeight(30);
    obj.label17:setText("Atual");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout20);
    obj.layout21:setAlign("top");
    obj.layout21:setHeight(360);
    obj.layout21:setName("layout21");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout21);
    obj.rectangle14:setAlign("left");
    obj.rectangle14:setWidth(100);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setName("rectangle14");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.rectangle14);
    obj.edit30:setMargins({top=5,bottom=5});
    obj.edit30:setAlign("top");
    obj.edit30:setField("Grad");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setName("edit30");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.rectangle14);
    obj.edit31:setMargins({bottom=5});
    obj.edit31:setAlign("top");
    obj.edit31:setField("CD");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setName("edit31");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.rectangle14);
    obj.edit32:setMargins({bottom=5});
    obj.edit32:setAlign("top");
    obj.edit32:setField("Efeito");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setName("edit32");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.rectangle14);
    obj.edit33:setMargins({bottom=5});
    obj.edit33:setAlign("top");
    obj.edit33:setField("Poder");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setName("edit33");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.rectangle14);
    obj.edit34:setMargins({bottom=5});
    obj.edit34:setAlign("top");
    obj.edit34:setField("Dano");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setName("edit34");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.rectangle14);
    obj.edit35:setMargins({bottom=5});
    obj.edit35:setAlign("top");
    obj.edit35:setField("Bonus");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setName("edit35");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.rectangle14);
    obj.edit36:setMargins({bottom=5});
    obj.edit36:setAlign("top");
    obj.edit36:setField("Range");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setName("edit36");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.rectangle14);
    obj.edit37:setMargins({bottom=5});
    obj.edit37:setAlign("top");
    obj.edit37:setField("Area");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setName("edit37");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.rectangle14);
    obj.edit38:setMargins({bottom=5});
    obj.edit38:setAlign("top");
    obj.edit38:setField("Duracao");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setName("edit38");

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
        end);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (event)
            enviarNaMesa()
        end);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (event)
            ListaDeFeitico()
        end);

    obj._e_event3 = obj.button3:addEventListener("onClick",
        function (event)
            Aceitar()
        end);

    obj._e_event4 = obj.button4:addEventListener("onClick",
        function (event)
            abrirPopUp()
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

        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.tipo ~= nil then self.tipo:destroy(); self.tipo = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.escola ~= nil then self.escola:destroy(); self.escola = nil; end;
        if self.popUp ~= nil then self.popUp:destroy(); self.popUp = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
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
