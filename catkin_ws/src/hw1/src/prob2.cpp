#include <ros/ros.h>
#include <visualization_msgs/Marker.h>
#include <tf/transform_broadcaster.h>
#include <geometry_msgs/Pose.h>

void pose_cb(const geometry_msgs::PoseConstPtr& msg, ros::Publisher& pub)
{
  visualization_msgs::Marker mk;
  mk.header.frame_id = "base_link";
  mk.id = 0;
  mk.type = visualization_msgs::Marker::CUBE;
  mk.action = visualization_msgs::Marker::ADD;
  mk.pose.position = msg->position;
  mk.pose.orientation = msg->orientation;
  mk.scale.x = 1;
  mk.scale.y = 1;
  mk.scale.z = 1;
  mk.color.a = 1.0; // Don't forget to set the alpha!
  mk.color.r = 1.0;
  mk.color.g = 0.0;
  mk.color.b = 0.0;

  pub.publish(mk);
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "hw1prob2");
  ros::NodeHandle nh;
  ros::Publisher pub = nh.advertise<visualization_msgs::Marker>("/marker", 1);
  
  ros::Subscriber sub = nh.subscribe<geometry_msgs::Pose>("/pose", 10, boost::bind(&pose_cb, _1, pub));

  ros::spin();
  return 0;
}
