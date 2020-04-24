import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

ListView{
    id:list
    clip: true
    boundsBehavior: ListView.StopAtBounds
    ScrollBar.vertical: ScrollBar{}
    delegate: ContactItem{
        ltext: name
        icon:{
            if(sicon)
                return sicon;
            else
                var a = Math.round(Math.random() * (8 - 1) + 1);
                if(a === 8)
                    return "icons/nnn.jpg";
                else
                    return "icons/" + a.toString(10) + ".jpg";
        }
        time: ttime
        mess: mmess
        coun: ccoun
        selected: list.currentIndex === index
        onLeftClick: {
            list.currentIndex = index
        }
    }
}
