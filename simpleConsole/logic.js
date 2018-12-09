let scope = {
    scomeName : "default scope"
}

function executeCmd(msg) {
    msg = msg.toString();

    let data  = {
       expression : msg
    }

    try {
       let func = new Function("return (" + msg + ");");
       data.result = JSON.stringify(func.call(scope), " ", 4);
    }
    catch (e){
       data.result = e.toString();
    }

    return data;
}
