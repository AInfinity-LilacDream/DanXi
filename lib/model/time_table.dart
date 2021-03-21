/*
 *     Copyright (C) 2021  w568w
 *
 *     This program is free software: you can redistribute it and/or modify
 *     it under the terms of the GNU General Public License as published by
 *     the Free Software Foundation, either version 3 of the License, or
 *     (at your option) any later version.
 *
 *     This program is distributed in the hope that it will be useful,
 *     but WITHOUT ANY WARRANTY; without even the implied warranty of
 *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *     GNU General Public License for more details.
 *
 *     You should have received a copy of the GNU General Public License
 *     along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */
import 'package:flutter_timetable_view/flutter_timetable_view.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'time_table.g.dart';

extension TableEventTimeEx on TableEventTime {
  TableEventTime addMin(int minutes) {
    DateTime time = add(Duration(minutes: minutes));
    return TableEventTime(hour: time.hour, minute: time.minute);
  }
}

@JsonSerializable()
class TimeTable {
  static final DateTime MONDAY = DateTime.utc(2021, 3, 22);
  static const int MINUTES_OF_COURSE = 45;
  static final List<TableEventTime> COURSE_SLOT_START_TIME = [
    TableEventTime(hour: 8, minute: 0),
    TableEventTime(hour: 8, minute: 55),
    TableEventTime(hour: 9, minute: 55),
    TableEventTime(hour: 10, minute: 50),
    TableEventTime(hour: 11, minute: 45),
    TableEventTime(hour: 13, minute: 30),
    TableEventTime(hour: 14, minute: 25),
    TableEventTime(hour: 15, minute: 25),
    TableEventTime(hour: 16, minute: 20),
    TableEventTime(hour: 17, minute: 15),
    TableEventTime(hour: 18, minute: 30),
    TableEventTime(hour: 19, minute: 25),
    TableEventTime(hour: 20, minute: 20),
    TableEventTime(hour: 21, minute: 15),
    TableEventTime(hour: 22, minute: 10),
  ];
  List<Course> courses = [];

  //First day of the term
  DateTime startTime;

  TimeTable();

  factory TimeTable.fromHtml(DateTime startTime, String tablePageSource) {
    TimeTable newTable = new TimeTable()..startTime = startTime;
    RegExp courseMatcher =
        RegExp(r'\t*activity = new.*\n(\t*index =.*\n\t*table0.*\n)*');
    for (Match matchedCourse in courseMatcher.allMatches(tablePageSource)) {
      newTable.courses.add(Course.fromHtmlPart(matchedCourse.group(0)));
    }
    return newTable;
  }

  factory TimeTable.fromJson(Map<String, dynamic> json) =>
      _$TimeTableFromJson(json);

  Map<String, dynamic> toJson() => _$TimeTableToJson(this);

  List<LaneEvents> toLaneEvents(int week, TimetableStyle style) {
    Map<int, List<TableEvent>> table = Map();
    List<LaneEvents> result = [];
    for (int i = 0; i < 7; i++) {
      table[i] = [];
    }
    courses.forEach((course) => course.times.forEach((courseTime) {
          table[courseTime.weekDay].add(TableEvent(
              title: course.courseName,
              start: COURSE_SLOT_START_TIME[courseTime.slot],
              end: COURSE_SLOT_START_TIME[courseTime.slot]
                  .addMin(MINUTES_OF_COURSE)));
        }));
    for (int i = 0; i < 7; i++) {
      result.add(LaneEvents(
          lane: Lane(
              width: style.laneWidth,
              height: style.laneHeight,
              name: DateFormat.EEEE().format(MONDAY.add(Duration(days: i)))),
          events: table[i]));
    }
    return result;
  }
}

@JsonSerializable()
class Course {
  List<String> teacherIds;
  List<String> teacherNames;
  String courseId;
  String courseName;
  String roomId;
  String roomName;
  List<int> availableWeeks;
  List<CourseTime> times;

  Course();

  static List<int> _parseWeeksFromString(String weekStr) {
    List<int> availableWeeks = [];
    for (int i = 0; i < weekStr.length; i++) {
      if (weekStr[i] == '1') {
        availableWeeks.add(i);
      }
    }
    return availableWeeks;
  }

  static List<CourseTime> _parseTimeFromStrings(Iterable<RegExpMatch> times) {
    List<CourseTime> courseTimes = [];
    courseTimes.addAll(times.map((RegExpMatch e) {
      List<String> daySlot = e.group(0).trim().split("*unitCount+");
      return CourseTime(int.parse(daySlot[0]), int.parse(daySlot[1]));
    }));
    return courseTimes;
  }

  factory Course.fromHtmlPart(String htmlPart) {
    Course newCourse = new Course();
    RegExp infoMatcher = RegExp(r'(?<=TaskActivity\(").*(?="\))');
    RegExp timeMatcher = RegExp(r'[0-9]+\*unitCount\+[0-9]+');
    String info = infoMatcher.firstMatch(htmlPart).group(0);

    List<String> infoVarList = info.split('","');
    return newCourse
      ..teacherIds = infoVarList[0].split(",")
      ..teacherNames = infoVarList[1].split(",")
      ..courseId = infoVarList[2]
      ..courseName = infoVarList[3]
      ..roomId = infoVarList[4]
      ..roomName = infoVarList[5]
      ..availableWeeks = _parseWeeksFromString(infoVarList[6])
      ..times = _parseTimeFromStrings(timeMatcher.allMatches(htmlPart));
  }

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}

@JsonSerializable()
class CourseTime {
  //Monday is 0, Morning lesson is 0
  int weekDay, slot;

  CourseTime(this.weekDay, this.slot);

  factory CourseTime.fromJson(Map<String, dynamic> json) =>
      _$CourseTimeFromJson(json);

  Map<String, dynamic> toJson() => _$CourseTimeToJson(this);
}