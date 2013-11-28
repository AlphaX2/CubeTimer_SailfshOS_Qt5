/****************************************************************************
** Meta object code from reading C++ file 'RubikTimerCom.hpp'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.1.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../src/RubikTimerCom.hpp"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'RubikTimerCom.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.1.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_RubikTimer_t {
    QByteArrayData data[30];
    char stringdata[383];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    offsetof(qt_meta_stringdata_RubikTimer_t, stringdata) + ofs \
        - idx * sizeof(QByteArrayData) \
    )
static const qt_meta_stringdata_RubikTimer_t qt_meta_stringdata_RubikTimer = {
    {
QT_MOC_LITERAL(0, 0, 10),
QT_MOC_LITERAL(1, 11, 11),
QT_MOC_LITERAL(2, 23, 0),
QT_MOC_LITERAL(3, 24, 14),
QT_MOC_LITERAL(4, 39, 11),
QT_MOC_LITERAL(5, 51, 16),
QT_MOC_LITERAL(6, 68, 17),
QT_MOC_LITERAL(7, 86, 21),
QT_MOC_LITERAL(8, 108, 9),
QT_MOC_LITERAL(9, 118, 4),
QT_MOC_LITERAL(10, 123, 4),
QT_MOC_LITERAL(11, 128, 9),
QT_MOC_LITERAL(12, 138, 14),
QT_MOC_LITERAL(13, 153, 12),
QT_MOC_LITERAL(14, 166, 16),
QT_MOC_LITERAL(15, 183, 21),
QT_MOC_LITERAL(16, 205, 11),
QT_MOC_LITERAL(17, 217, 12),
QT_MOC_LITERAL(18, 230, 9),
QT_MOC_LITERAL(19, 240, 10),
QT_MOC_LITERAL(20, 251, 3),
QT_MOC_LITERAL(21, 255, 12),
QT_MOC_LITERAL(22, 268, 9),
QT_MOC_LITERAL(23, 278, 11),
QT_MOC_LITERAL(24, 290, 14),
QT_MOC_LITERAL(25, 305, 17),
QT_MOC_LITERAL(26, 323, 14),
QT_MOC_LITERAL(27, 338, 13),
QT_MOC_LITERAL(28, 352, 14),
QT_MOC_LITERAL(29, 367, 14)
    },
    "RubikTimer\0bestChanged\0\0averageChanged\0"
    "lastChanged\0stopwatchChanged\0"
    "inspectionChanged\0inspectionTimeChanged\0"
    "saveTimes\0best\0last\0loadTimes\0"
    "getScrambleStr\0restartTimer\0"
    "getNewTimeString\0getNewCountdownString\0"
    "checkRecord\0saveSettings\0stopwatch\0"
    "inspection\0sec\0loadSettings\0resetData\0"
    "resetRecord\0bestTimeString\0averageTimeString\0"
    "lastTimeString\0stopwatchMode\0"
    "inspectionMode\0inspectionTime\0"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_RubikTimer[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
      17,   14, // methods
       6,  132, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       6,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   99,    2, 0x05,
       3,    0,  100,    2, 0x05,
       4,    0,  101,    2, 0x05,
       5,    0,  102,    2, 0x05,
       6,    0,  103,    2, 0x05,
       7,    0,  104,    2, 0x05,

 // methods: name, argc, parameters, tag, flags
       8,    2,  105,    2, 0x02,
      11,    0,  110,    2, 0x02,
      12,    0,  111,    2, 0x02,
      13,    0,  112,    2, 0x02,
      14,    0,  113,    2, 0x02,
      15,    1,  114,    2, 0x02,
      16,    2,  117,    2, 0x02,
      17,    3,  122,    2, 0x02,
      21,    0,  129,    2, 0x02,
      22,    0,  130,    2, 0x02,
      23,    0,  131,    2, 0x02,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void, QMetaType::QString, QMetaType::QString,    9,   10,
    QMetaType::Void,
    QMetaType::QString,
    QMetaType::Void,
    QMetaType::QString,
    QMetaType::QString, QMetaType::Int,    2,
    QMetaType::Bool, QMetaType::QString, QMetaType::QString,    9,   10,
    QMetaType::Void, QMetaType::Bool, QMetaType::Bool, QMetaType::Int,   18,   19,   20,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // properties: name, type, flags
      24, QMetaType::QString, 0x00495001,
      25, QMetaType::QString, 0x00495001,
      26, QMetaType::QString, 0x00495001,
      27, QMetaType::Bool, 0x00495001,
      28, QMetaType::Bool, 0x00495001,
      29, QMetaType::Int, 0x00495001,

 // properties: notify_signal_id
       0,
       1,
       2,
       3,
       4,
       5,

       0        // eod
};

void RubikTimer::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        RubikTimer *_t = static_cast<RubikTimer *>(_o);
        switch (_id) {
        case 0: _t->bestChanged(); break;
        case 1: _t->averageChanged(); break;
        case 2: _t->lastChanged(); break;
        case 3: _t->stopwatchChanged(); break;
        case 4: _t->inspectionChanged(); break;
        case 5: _t->inspectionTimeChanged(); break;
        case 6: _t->saveTimes((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 7: _t->loadTimes(); break;
        case 8: { QString _r = _t->getScrambleStr();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 9: _t->restartTimer(); break;
        case 10: { QString _r = _t->getNewTimeString();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 11: { QString _r = _t->getNewCountdownString((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 12: { bool _r = _t->checkRecord((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        case 13: _t->saveSettings((*reinterpret_cast< bool(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2])),(*reinterpret_cast< int(*)>(_a[3]))); break;
        case 14: _t->loadSettings(); break;
        case 15: _t->resetData(); break;
        case 16: _t->resetRecord(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (RubikTimer::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&RubikTimer::bestChanged)) {
                *result = 0;
            }
        }
        {
            typedef void (RubikTimer::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&RubikTimer::averageChanged)) {
                *result = 1;
            }
        }
        {
            typedef void (RubikTimer::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&RubikTimer::lastChanged)) {
                *result = 2;
            }
        }
        {
            typedef void (RubikTimer::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&RubikTimer::stopwatchChanged)) {
                *result = 3;
            }
        }
        {
            typedef void (RubikTimer::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&RubikTimer::inspectionChanged)) {
                *result = 4;
            }
        }
        {
            typedef void (RubikTimer::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&RubikTimer::inspectionTimeChanged)) {
                *result = 5;
            }
        }
    }
}

const QMetaObject RubikTimer::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_RubikTimer.data,
      qt_meta_data_RubikTimer,  qt_static_metacall, 0, 0}
};


const QMetaObject *RubikTimer::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *RubikTimer::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_RubikTimer.stringdata))
        return static_cast<void*>(const_cast< RubikTimer*>(this));
    return QObject::qt_metacast(_clname);
}

int RubikTimer::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 17)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 17;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 17)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 17;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = getBestTime(); break;
        case 1: *reinterpret_cast< QString*>(_v) = getAverageTime(); break;
        case 2: *reinterpret_cast< QString*>(_v) = getLastTime(); break;
        case 3: *reinterpret_cast< bool*>(_v) = getStopwatchMode(); break;
        case 4: *reinterpret_cast< bool*>(_v) = getInspectionMode(); break;
        case 5: *reinterpret_cast< int*>(_v) = getInspectionTime(); break;
        }
        _id -= 6;
    } else if (_c == QMetaObject::WriteProperty) {
        _id -= 6;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 6;
    } else if (_c == QMetaObject::RegisterPropertyMetaType) {
        if (_id < 6)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 6;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void RubikTimer::bestChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}

// SIGNAL 1
void RubikTimer::averageChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, 0);
}

// SIGNAL 2
void RubikTimer::lastChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, 0);
}

// SIGNAL 3
void RubikTimer::stopwatchChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, 0);
}

// SIGNAL 4
void RubikTimer::inspectionChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, 0);
}

// SIGNAL 5
void RubikTimer::inspectionTimeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, 0);
}
QT_END_MOC_NAMESPACE
