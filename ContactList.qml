import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

ListView{
    id:list
    clip: true
    boundsBehavior: ListView.StopAtBounds
    ScrollBar.vertical: ScrollBar{}
    delegate: ContactItem{
        ltext: {
            if(nname)
                return nname;
            else
                return "";
        }
        icon:{
            if(iicon)
                return iicon;
            else
                var a = Math.round(Math.random() * (8 - 1) + 1);
            if(a === 8)
                return "icons/nnn.jpg";
            else
                return "icons/" + a.toString(10) + ".jpg";
        }
//        time: {
//            if(ttime)
//                return ttime;
//            else
//                return "только что";
//        }
        mess: {
            if(mmess)
                return mmess
            else
                return "Hey there! I am using WhatsApp.";
        }
//        coun:{
//            if(ccoun)
//                return ccoun;
//            else
//                return "1";
//        }
        selected: list.currentIndex === index
        onLeftClick: {
            list.currentIndex = index
        }
    }
}
