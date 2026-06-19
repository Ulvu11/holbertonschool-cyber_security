# Mandatory Access Control (MAC)

Mandatory Access Control (MAC) is a security model that restricts access to system resources based on centrally defined security policies. Unlike Discretionary Access Control (DAC), users and processes cannot override these restrictions, even with elevated privileges.

## Purpose

The purpose of MAC is to strengthen system security by enforcing the principle of least privilege. It helps prevent unauthorized access, limits the impact of compromised applications, and protects sensitive resources from misuse.

## Common Implementations

Linux systems commonly implement MAC through Security-Enhanced Linux (SELinux) and AppArmor. These frameworks apply security policies that define which actions processes and users are allowed to perform on files, directories, network resources, and other system objects.

## Key Concepts

MAC systems rely on security policies, labels, profiles, and access rules to control interactions between subjects (users or processes) and objects (files, directories, devices, etc.). SELinux uses labels and Type Enforcement, while AppArmor uses path-based profiles.

## Important Note

MAC adds an additional layer of security on top of traditional Linux permissions. Proper configuration and monitoring are essential to ensure that security policies provide protection without disrupting legitimate system operations.
